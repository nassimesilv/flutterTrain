import 'package:flutter/material.dart';

class CircleAvatarBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: getFavoritesCircleAvatar(),
      ),
    );
  }
}

class FavoriteCircleAvatar extends StatelessWidget {
  final Image image;

  FavoriteCircleAvatar({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {
          // TODO: Navigate to barber page
        },
        child: CircleAvatar(
          minRadius: 20.0,
          maxRadius: 30.0,
          child: ClipOval(
            child: Image.asset('images/fakeCircleAvatar.jpg')
          )
          //TODO Add background Image
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
