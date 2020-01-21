import 'package:flutter/material.dart';
import 'package:koop/screens/barber_profile_screen.dart';

class CircleAvatarBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView(
        children: getFavoritesCircleAvatar(),
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
            Navigator.pushNamed(context, BarberProfileScreen.title, arguments: barberId);
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
