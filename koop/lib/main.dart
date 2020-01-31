import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:koop/screens/barber_profile_screen.dart';
import 'package:koop/screens/cgu_screen.dart';
import 'package:koop/screens/home_screen.dart';
import 'package:koop/screens/login_screen.dart';
import 'package:koop/screens/sign_up_screen.dart';
import 'package:koop/screens/vertical_slider_screen.dart';
import 'package:koop/services/auth.service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AuthService>(
      child: MyApp(),
      create: (BuildContext context) {
        return AuthService();
      },
    ),
  );
  configLoading();
}

class MyApp extends StatelessWidget {
  // TODO: Handle restore if already signed in else show sign in page
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.dark,
      data: (brightness) => brightness == Brightness.dark
          ? ThemeData.dark().copyWith(
              accentColor: Color(0xFFD4AF37),
              indicatorColor: Color(0xFFD4AF37),
              toggleableActiveColor: Color(0xFFD4AF37),
            )
          : ThemeData.light().copyWith(
              appBarTheme:
                  ThemeData.light().appBarTheme.copyWith(color: Colors.white),
              primaryTextTheme:
                  TextTheme(title: TextStyle(color: Colors.black)),
              accentColor: Color(0xFFD4AF37),
              indicatorColor: Color(0xFFD4AF37),
              toggleableActiveColor: Color(0xFFD4AF37),
            ),
      themedWidgetBuilder: (context, theme) {
        return FlutterEasyLoading(
          child: MaterialApp(
            title: 'Koop',
            theme: theme,
            home: FutureBuilder(
              future: Provider.of<AuthService>(context).getUser(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return snapshot.hasData ? HomeScreen() : LoginScreen();
                } else {
                  return SpinKitRotatingCircle(
                    color: Colors.white,
                    size: 50.0,
                  );
                }
              },
            ),
            routes: {
              LoginScreen.title: (context) => LoginScreen(),
              SignUpScreen.title: (context) => SignUpScreen(),
              CGUScreen.title: (context) => CGUScreen(),
              HomeScreen.title: (context) => HomeScreen(),
              BarberProfileScreen.title: (context) => BarberProfileScreen(),
              VerticalSliderScreen.title: (context) => VerticalSliderScreen(),
            },
          ),
        );
      },
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskColor = Colors.black.withOpacity(0.5)
    ..userInteractions = false;
}
