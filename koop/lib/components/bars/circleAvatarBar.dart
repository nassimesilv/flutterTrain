import 'package:flutter/material.dart';
import 'package:koop/models/barber.model.dart';
import 'package:koop/screens/barber_profile_screen.dart';
import 'package:koop/services/barberSliders.service.dart';
import 'package:koop/utils/constants.dart';

class CircleAvatarBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView(
        children: getFavoritesSquareAvatar(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class FavoriteCircleAvatar extends StatelessWidget {
  final Image image;
  final String barberId;

  FavoriteCircleAvatar({this.image, this.barberId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      child: Container(
        margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 10.0),
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          shape: BoxShape.circle,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => BarberProfileScreen(
                  barberId: this.barberId,
                ),
              ),
            );
          },
          child: CircleAvatar(
              child: ClipOval(child: Image.asset('images/fakeCircleAvatar.jpg'))
              //TODO Add background Image
              ),
        ),
      ),
    );
  }
}

class FavoriteSquareAvatar extends StatelessWidget {
  final Image image;
  final BarberModel model;
  final String barberId;
  final bool isHomeAvatar;

  FavoriteSquareAvatar({this.image, this.barberId, this.model, this.isHomeAvatar = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * kHomeAppBarExpandedHeightRatio,
      margin: isHomeAvatar ? EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 10.0) : null,
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kCardBorderRadius),
        color: Theme.of(context).accentColor,
        shape: BoxShape.rectangle,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => BarberProfileScreen(
                barberId: '0',
                model: model,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(model == null ? 'images/fakeBarberProfileImage.jpg' : model.imagePath),
            ),
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}

List<FavoriteCircleAvatar> getFavoritesCircleAvatar() {
  //TODO Request favorites image from background
  List<FavoriteCircleAvatar> favoriteCircleAvatar = [];
  const favoriteCircleLength = 10;
  for (int i = 0; i < favoriteCircleLength; i++) {
    favoriteCircleAvatar.add(
      FavoriteCircleAvatar(
        image: null,
      ),
    );
  }
  return favoriteCircleAvatar;
}

List<FavoriteSquareAvatar> getFavoritesSquareAvatar() {
  //TODO Request favorites image from background
  List<FavoriteSquareAvatar> favoriteSquareAvatar = [];
  var list = BarberSliderService().getSearchcards();
  for (BarberModel model in list) {
    favoriteSquareAvatar.add(
      FavoriteSquareAvatar(
        model: model,
        isHomeAvatar: true,
      ),
    );
  }
  for (BarberModel model in list) {
    favoriteSquareAvatar.add(
      FavoriteSquareAvatar(
        model: model,
      ),
    );
  }
  
  return favoriteSquareAvatar;
}
