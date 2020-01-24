import 'package:flutter/material.dart';
import 'package:koop/models/barberCard.model.dart';
import 'package:koop/screens/barber_profile_screen.dart';
import 'package:koop/utils/constants.dart';
import 'package:like_button/like_button.dart';

class BarberCard extends StatelessWidget {
  final BarberCardModel model;

  BarberCard(
      {@required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => BarberProfileScreen(
                  barberId: '0',
                  model: this.model,
                ),
              ),
            );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.9,
          width: MediaQuery.of(context).size.width / 1.2,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kCardBorderRadius)),
            elevation: 6.0,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(kCardBorderRadius),
                            topRight: Radius.circular(kCardBorderRadius),
                          ),
                          child: Image.asset(
                            model.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 6.0,
                        left: 6.0,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: LikeButton(
                            size: MediaQuery.of(context).size.height * 0.04,
                            circleColor: CircleColor(
                                start: Colors.pink,
                                end: Theme.of(context).accentColor),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Colors.pink,
                              dotSecondaryColor:
                                  Theme.of(context).accentColor,
                            ),
                            countPostion: CountPostion.right,
                            likeBuilder: (bool isLiked) {
                              return isLiked
                                  ? Icon(
                                      Icons.favorite,
                                      color: Theme.of(context).accentColor,
                                      size:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      color: Theme.of(context).accentColor,
                                      size:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    );
                            },
                            likeCount: model.likeCount,
                            countBuilder:
                                (int count, bool isLiked, String text) {
                              var color =
                                  isLiked ? Colors.white : Colors.grey;
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
                        ),
                      ),
                      Positioned(
                        top: 6.0,
                        right: 6.0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(kCardBorderRadius)),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: kRatingStarColor,
                                  size: 15,
                                ),
                                Text(
                                  ' ${model.rate} ',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      '${model.name}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 7.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          child: Text(
                            '${model.address}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Container(
                        child: Text(
                          '${model.distance} km',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
