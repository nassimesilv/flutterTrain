import 'package:flutter/material.dart';
import 'package:koop/models/barber.model.dart';
import 'package:koop/screens/barber_profile_screen.dart';
import 'package:koop/utils/constants.dart';
import 'package:like_button/like_button.dart';

const double cardCircularBorderRadius = kCardBorderRadius;
const double cardPadding = 10.0;

class SearchCard extends StatelessWidget {
  final BarberModel model;

  SearchCard({this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * kSearchCardHeightRatio,
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
                image: AssetImage(model.imagePath),
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.hardLight),
              ),
            ),
            child: _columnWithContent(context, this.model),
          ),
        ),
      ),
    );
  }
}

_columnWithContent(BuildContext context, BarberModel model) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${model.name}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * kSearchCardTitleSizeRatio,
                ),
              ),
              Text(
                '${model.address}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * kSearchCardSubTitleSizeRatio,
                  color: Colors.white,
                ),
              ),
              Text(
                '${model.distance} km',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * kSearchCardSubTitleSizeRatio,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      LikeButton(
        size: MediaQuery.of(context).size.height * kSearchCardIconSizeRatio,
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
                  size: MediaQuery.of(context).size.height * kSearchCardIconSizeRatio,
                )
              : Icon(
                  Icons.favorite_border,
                  color: Theme.of(context).accentColor,
                  size: MediaQuery.of(context).size.height * kSearchCardIconSizeRatio,
                );
        },
        likeCount: model.likeCount,
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
