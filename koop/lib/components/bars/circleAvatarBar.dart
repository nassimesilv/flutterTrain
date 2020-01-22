import 'package:flutter/material.dart';
import 'package:koop/screens/barber_profile_screen.dart';
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
            Navigator.pushNamed(context, BarberProfileScreen.title,
                arguments: barberId);
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
  final String barberId;

  FavoriteSquareAvatar({this.image, this.barberId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      child: Container(
        margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 10.0),
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kCardBorderRadius),
          color: Theme.of(context).accentColor,
          shape: BoxShape.rectangle,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, BarberProfileScreen.title,
                arguments: barberId);
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/fakeCircleAvatar.jpg'),
              ),
              borderRadius: BorderRadius.circular(kCardBorderRadius),
              shape: BoxShape.rectangle,
            ),
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
  const favoriteSquareLength = 10;
  for (int i = 0; i < favoriteSquareLength; i++) {
    favoriteSquareAvatar.add(
      FavoriteSquareAvatar(
        image: null,
      ),
    );
  }
  return favoriteSquareAvatar;
}
