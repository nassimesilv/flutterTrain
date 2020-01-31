import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:koop/models/barber.model.dart';
import 'package:koop/models/barberSlider.model.dart';
import 'package:koop/services/auth.service.dart';
import 'package:koop/services/secureStore.mixin.dart';
import 'package:koop/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BarberSliderService with SecureStoreMixin {
  Future<List<BarberSliderModel>> getHomeSliders({Position currentPosition}) async {
    try {
      // final accessToken = await getSecureStore(kAccessTokenKey);
      // final http.Response response = await http.get(
      //   'url',
      //   headers: {HttpHeaders.authorizationHeader: accessToken},
      // );

      // if (response.statusCode == 200) {
      //   final retVal = json.decode(response.body).map((slider) => BarberSliderModel.fromJson(slider));
      // } else {
      //   throw Exception('Failed');
      // }
      await Future.delayed(Duration(seconds: 4));
      return getFakeSliders();
    } catch (e) {
      print(e);
      return null;
    }
  }

  List<BarberSliderModel> getFakeSliders({Position currentPosition}) {
    List<BarberModel> barberCardList = [
      BarberModel(
          barberId: '',
          name: 'Grizzly Barber Shop',
          address: Address(label: '80 Boulevard Beaumarchais, 75011 Paris'),
          rate: 4.5,
          distance: 2,
          likeCount: 300,
          reviewsCount: 222,
          imagePath: 'images/backgroundPicture/image1.jpg'),
      BarberModel(
          barberId: '',
          name: 'Tag Barber Shop',
          address: Address(label: '113 Rue des Dames, 75017 Paris'),
          rate: 4.8,
          distance: 3,
          likeCount: 106,
          reviewsCount: 91,
          imagePath: 'images/backgroundPicture/image2.jpg'),
      BarberModel(
          barberId: '',
          name: 'Original Barber Shop',
          address: Address(label: '56 Rue du Temple, 75004 Paris, 75011 Paris'),
          rate: 3.4,
          distance: 1.5,
          likeCount: 80,
          reviewsCount: 149,
          imagePath: 'images/backgroundPicture/image3.jpg'),
      BarberModel(
          barberId: '',
          name: 'V Barber and Shop | VBS',
          address: Address(label: '96 Rue du Faubourg Poissonnière, 75010 Paris'),
          rate: 4.5,
          distance: 13.5,
          likeCount: 154,
          reviewsCount: 99,
          imagePath: 'images/backgroundPicture/image4.jpg'),
      BarberModel(
          barberId: '',
          name: 'Barbier Paris 14 - GéGé Barbershop',
          address: Address(label: '126 Rue d\'Alésia, 75014 Paris'),
          rate: 4.1,
          distance: 8.3,
          likeCount: 72,
          reviewsCount: 117,
          imagePath: 'images/backgroundPicture/image5.jpg'),
    ];

    List<BarberSliderModel> barberSliderList = [
      BarberSliderModel(
        sliderTitle: 'Les meilleurs',
        barberCardList: [
          barberCardList[0],
          barberCardList[1],
          barberCardList[2]
        ],
      ),
      BarberSliderModel(
        sliderTitle: 'Tendances',
        barberCardList: [barberCardList[3], barberCardList[4]],
      ),
      BarberSliderModel(
        sliderTitle: 'Dans le coin',
        barberCardList: [
          barberCardList[0],
          barberCardList[1],
          barberCardList[2],
          barberCardList[3],
          barberCardList[4]
        ],
      )
    ];

    return barberSliderList;
  }

  List<BarberModel> getSearchcards() {
    List<BarberModel> barberCardList = [
      BarberModel(
          barberId: '',
          name: 'Grizzly Barber Shop',
          address: Address(label: '80 Boulevard Beaumarchais, 75011 Paris'),
          rate: 4.5,
          distance: 2,
          likeCount: 300,
          reviewsCount: 222,
          imagePath: 'images/backgroundPicture/image1.jpg'),
      BarberModel(
          barberId: '',
          name: 'Tag Barber Shop',
          address: Address(label: '113 Rue des Dames, 75017 Paris'),
          rate: 4.8,
          distance: 3,
          likeCount: 106,
          reviewsCount: 91,
          imagePath: 'images/backgroundPicture/image2.jpg'),
      BarberModel(
          barberId: '',
          name: 'Original Barber Shop',
          address: Address(label: '56 Rue du Temple, 75004 Paris, 75011 Paris'),
          rate: 3.4,
          distance: 1.5,
          likeCount: 80,
          reviewsCount: 149,
          imagePath: 'images/backgroundPicture/image3.jpg'),
      BarberModel(
          barberId: '',
          name: 'V Barber and Shop | VBS',
          address: Address(label: '96 Rue du Faubourg Poissonnière, 75010 Paris'),
          rate: 4.5,
          distance: 13.5,
          likeCount: 154,
          reviewsCount: 99,
          imagePath: 'images/backgroundPicture/image4.jpg'),
      BarberModel(
          barberId: '',
          name: 'Barbier Paris 14 - GéGé Barbershop',
          address: Address(label: '126 Rue d\'Alésia, 75014 Paris'),
          rate: 4.1,
          distance: 8.3,
          likeCount: 72,
          reviewsCount: 63,
          imagePath: 'images/backgroundPicture/image5.jpg'),
    ];

    return barberCardList;
  }
}
