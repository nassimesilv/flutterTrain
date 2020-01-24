import 'package:geolocator/geolocator.dart';
import 'package:koop/components/cards/barberCard.dart';
import 'package:koop/models/barberCard.model.dart';
import 'package:koop/models/barberSlider.model.dart';

class BarberSliderService {
  List<BarberSlider> getHomeSliders(Position currentPosition) {
    List<BarberCardModel> barberCardList = [
      BarberCardModel(
          name: 'Grizzly Barber Shop',
          address: '80 Boulevard Beaumarchais, 75011 Paris',
          rate: 4.5,
          distance: 2,
          likeCount: 300,
          reviewsCount: 222,
          imageUrl: 'images/backgroundPicture/image1.jpg'),
      BarberCardModel(
          name: 'Tag Barber Shop',
          address: '113 Rue des Dames, 75017 Paris',
          rate: 4.8,
          distance: 3,
          likeCount: 106,
          reviewsCount: 91,
          imageUrl: 'images/backgroundPicture/image2.jpg'),
      BarberCardModel(
          name: 'Original Barber Shop',
          address: '56 Rue du Temple, 75004 Paris, 75011 Paris',
          rate: 3.4,
          distance: 1.5,
          likeCount: 80,
          reviewsCount: 149,
          imageUrl: 'images/backgroundPicture/image3.jpg'),
      BarberCardModel(
          name: 'V Barber and Shop | VBS',
          address: '96 Rue du Faubourg Poissonnière, 75010 Paris',
          rate: 4.5,
          distance: 13.5,
          likeCount: 154,
          reviewsCount: 99,
          imageUrl: 'images/backgroundPicture/image4.jpg'),
      BarberCardModel(
          name: 'Barbier Paris 14 - GéGé Barbershop',
          address: '126 Rue d\'Alésia, 75014 Paris',
          rate: 4.1,
          distance: 8.3,
          likeCount: 72,
          reviewsCount: 117,
          imageUrl: 'images/backgroundPicture/image5.jpg'),
    ];

    List<BarberSlider> barberSliderList = [
      BarberSlider(
        sliderTitle: 'Les meilleurs',
        barberCardList: [
          barberCardList[0],
          barberCardList[1],
          barberCardList[2]
        ],
      ),
      BarberSlider(
        sliderTitle: 'Tendances',
        barberCardList: [barberCardList[3], barberCardList[4]],
      ),
      BarberSlider(
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

  List<BarberCardModel> getSearchcards() {
    List<BarberCardModel> barberCardList = [
      BarberCardModel(
          name: 'Grizzly Barber Shop',
          address: '80 Boulevard Beaumarchais, 75011 Paris',
          rate: 4.5,
          distance: 2,
          likeCount: 300,
          reviewsCount: 222,
          imageUrl: 'images/backgroundPicture/image1.jpg'),
      BarberCardModel(
          name: 'Tag Barber Shop',
          address: '113 Rue des Dames, 75017 Paris',
          rate: 4.8,
          distance: 3,
          likeCount: 106,
          reviewsCount: 91,
          imageUrl: 'images/backgroundPicture/image2.jpg'),
      BarberCardModel(
          name: 'Original Barber Shop',
          address: '56 Rue du Temple, 75004 Paris, 75011 Paris',
          rate: 3.4,
          distance: 1.5,
          likeCount: 80,
          reviewsCount: 149,
          imageUrl: 'images/backgroundPicture/image3.jpg'),
      BarberCardModel(
          name: 'V Barber and Shop | VBS',
          address: '96 Rue du Faubourg Poissonnière, 75010 Paris',
          rate: 4.5,
          distance: 13.5,
          likeCount: 154,
          reviewsCount: 99,
          imageUrl: 'images/backgroundPicture/image4.jpg'),
      BarberCardModel(
          name: 'Barbier Paris 14 - GéGé Barbershop',
          address: '126 Rue d\'Alésia, 75014 Paris',
          rate: 4.1,
          distance: 8.3,
          likeCount: 72,
          reviewsCount: 63,
          imageUrl: 'images/backgroundPicture/image5.jpg'),
    ];

    return barberCardList;
  }
}
