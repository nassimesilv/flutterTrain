import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:koop/services/secureStore.mixin.dart';
import 'package:koop/utils/constants.dart';

class Address {
  String label;
  int postcode;
  String city;
  String country;
  Point coordinates;

  Address(
      {this.label, this.postcode, this.city, this.country, this.coordinates});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      label: json['label'],
      postcode: json['postcode'],
      city: json['city'],
      country: json['country'],
      coordinates: Point(json['coord']['coordinates'][0], json['coord']['coordinates'][1]),
    );
  }
}

class User {
  String userId;
  String email;
  String firstName;
  String lastName;
  Address address;
  String type;

  User(
      {this.address,
      this.email,
      this.firstName,
      this.lastName,
      this.userId,
      this.type});
}

class LoginResponse {
  String accessToken;
  String clientId;
  String refreshToken;
  String userId;

  LoginResponse({
    this.userId,
    this.accessToken,
    this.clientId,
    this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'],
      clientId: json['client_id'],
      refreshToken: json['refresh_token'],
      userId: json['user_id'],
    );
  }
}

class AuthService extends SecureStoreMixin with ChangeNotifier {
  var _client = http.Client();
  final facebookLogin = FacebookLogin();
  User _user;

  Future getUser() {
    return Future.value(this._user);
  }

  Future<bool> signIn({String email, String password}) async {
    try {
      await signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signInWithEmailAndPassword(
      {String email, String password}) async {
    try {
      http.Response response = await this._client.post('url', body: {
        'grant_type': 'password',
        'username': email,
        'password': password,
        'scope': 'default'
      });
      LoginResponse loginResponse =
          LoginResponse.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        setSecureStore(kAccessTokenKey, loginResponse.accessToken);
        setSecureStore(kClientIdKey, loginResponse.clientId);
        setSecureStore(kRefreshTokenKey, loginResponse.refreshToken);
        setSecureStore(kUserIdKey, loginResponse.userId);
        this._user = User(email: email, userId: loginResponse.userId);
        notifyListeners();
      } else if (response.statusCode == 400) {
        throw Exception('Wrong email/password');
      } else if (response.statusCode == 401) {
        refreshToken(loginResponse.refreshToken);
        return await signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw (e);
    }
  }

  Future<bool> signOut() async {
    try {
      var accessTokenToRevoke = await getSecureStore(kAccessTokenKey);

      http.Response response = await this._client.post(
        'url',
        body: {
          'token': accessTokenToRevoke,
        },
        headers: {HttpHeaders.authorizationHeader: accessTokenToRevoke},
        //TODO Implement basic_auth
      );

      if (response.statusCode == 200) {
        _user = null;
        notifyListeners();
        return true;
      } else {
        throw Exception('Unable to login');
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> refreshToken(String refreshToken) async {
    try {
      http.Response response = await this._client.post('url', body: {
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
        'scope': 'default'
      });
      if (response.statusCode == 200) {
        LoginResponse loginResponse =
            LoginResponse.fromJson(json.decode(response.body));
        setSecureStore(kAccessTokenKey, loginResponse.accessToken);
        setSecureStore(kClientIdKey, loginResponse.clientId);
        setSecureStore(kRefreshTokenKey, loginResponse.refreshToken);
        setSecureStore(kUserIdKey, loginResponse.userId);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw (e);
    }
  }

  Future<bool> signUp({String email, String password, String type}) async {
    try {
      http.Response response = await this._client.post(
        'url',
        body: {
          'email': email,
          'password': password,
          'type': type,
        },
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        LoginResponse loginResponse =
            LoginResponse.fromJson(json.decode(response.body));
        setSecureStore(kUserIdKey, loginResponse.userId);
        this._user =
            User(email: email, type: type, userId: loginResponse.userId);
        notifyListeners();
        return true;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> sendForgotPasswordEMail({String email}) async {
    try {
      http.Response response = await this._client.post(
        'url',
        body: {
          'email': email,
        },
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkForgotPasswordCode({String code}) async {
    try {
      http.Response response = await this._client.get(
        'url',
        // TODO Demander a salem body pas dans get request
        /* body: {
          'code': code,
        }, */
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> changePassword({String newPassword, String code}) async {
    try {
      http.Response response = await this._client.post(
        'url',
        body: {
          'code': code,
          'newPassword': newPassword,
        },
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> signInWithFacebook() async {
    try {
      var result = await facebookLogin.logIn(['email']);

      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          print(result.accessToken.token);
          setSecureStore(kFbAccessToken, result.accessToken.token);
          this.getFbUser();
          return true;
          break;
        case FacebookLoginStatus.cancelledByUser:
          return false;
        case FacebookLoginStatus.error:
          throw Exception('Error logging in');
        default:
          return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> signOutFb() async =>
      FacebookLogin.channel.invokeMethod('logOut');

  Future<User> getFbUser() async {
    try {
      final token = getSecureStore(kFbAccessToken);
      final http.Response response = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
      if (response.statusCode == 200) {
        final profile = jsonDecode(response.body);
        this._user = User(email: profile.email);
        print(this._user.email);
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      print(e);
    }
  }
}
