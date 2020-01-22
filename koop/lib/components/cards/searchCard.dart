import 'package:flutter/material.dart';
import 'package:koop/screens/barber_profile_screen.dart';
import 'package:koop/utils/constants.dart';
import 'package:like_button/like_button.dart';

const double cardCircularBorderRadius = kCardBorderRadius;
const double cardPadding = 10.0;

class SearchCard extends StatelessWidget {
  final ImageProvider image;

  SearchCard({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.17,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardCircularBorderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(cardCircularBorderRadius),
          child: Container(
            padding: EdgeInsets.all(cardPadding),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: image,
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.hardLight),
              ),
            ),
            child: _columnWithContent(context),
          ),
        ),
      ),
    );
  }
}

_columnWithContent(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, BarberProfileScreen.title);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Barber  Shop',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                ),
              ),
              Text(
                '30 bis avenue du general sarrail, Chalons-en-Champagne',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.white,
                ),
              ),
              Text(
                '2.3 km',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      LikeButton(
        size: MediaQuery.of(context).size.height * 0.04,
        circleColor:
            CircleColor(start: Colors.pink, end: Theme.of(context).accentColor),
        bubblesColor: BubblesColor(
          dotPrimaryColor: Colors.pink,
          dotSecondaryColor: Theme.of(context).accentColor,
        ),
        countPostion: CountPostion.bottom,
        likeBuilder: (bool isLiked) {
          return isLiked
              ? Icon(
                  Icons.favorite,
                  color: Theme.of(context).accentColor,
                  size: MediaQuery.of(context).size.height * 0.04,
                )
              : Icon(
                  Icons.favorite_border,
                  color: Theme.of(context).accentColor,
                  size: MediaQuery.of(context).size.height * 0.04,
                );
        },
        likeCount: 0,
        countBuilder: (int count, bool isLiked, String text) {
          var color = isLiked ? Colors.white : Colors.grey;
          Widget result;
          if (count == 0) {
            result = Text(
              "",
            );
          } else
            result = Text(
              text,
              style: TextStyle(color: color),
            );
          return result;
        },
      ),
    ],
  );
}
