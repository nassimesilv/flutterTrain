import 'package:flutter/material.dart';
import 'package:koop/models/barber.model.dart';
import 'package:koop/screens/barber_profile_screen.dart';
import 'package:koop/utils/constants.dart';
import 'package:like_button/like_button.dart';

class BarberCard extends StatelessWidget {
  final BarberModel model;

  BarberCard({@required this.model});

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
      child: Container(
        width: MediaQuery.of(context).size.width * kSliderBarberCardWidth,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kCardBorderRadius)),
          elevation: 6.0,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kCardBorderRadius),
                          topRight: Radius.circular(kCardBorderRadius),
                        ),
                        child: Image.asset(
                          model.imagePath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 6.0,
                      left: 6.0,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(kCardBorderRadius)),
                        child: Container(
                          height: MediaQuery.of(context).size.height * kBarberCardFavoriteCardHeightRatio,
                          width: MediaQuery.of(context).size.width * kBarberCardFavoriteCardWidthRatio,
                          child: LikeButton(
                            circleColor: CircleColor(
                                start: Colors.pink,
                                end: Theme.of(context).accentColor),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Colors.pink,
                              dotSecondaryColor: Theme.of(context).accentColor,
                            ),
                            countPostion: CountPostion.right,
                            likeBuilder: (bool isLiked) {
                              return isLiked
                                  ? Icon(
                                      Icons.favorite,
                                      color: Theme.of(context).accentColor,
                                      size: MediaQuery.of(context).size.height *
                                          kBarberCardIconSizeRatio,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      color: Theme.of(context).accentColor,
                                      size: MediaQuery.of(context).size.height *
                                          kBarberCardIconSizeRatio,
                                    );
                            },
                            likeCount: model.likeCount,
                            countBuilder:
                                (int count, bool isLiked, String text) {
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
                          child: Container(
                            height: MediaQuery.of(context).size.height * kBarberCardFavoriteCardHeightRatio,
                            width: MediaQuery.of(context).size.width * kBarberCardFavoriteCardWidthRatio,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: kRatingStarColor,
                                  size:
                                      MediaQuery.of(context).size.height * kBarberCardIconSizeRatio,
                                ),
                                Text(
                                  ' ${model.rate} ',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(13.0, 5.0, 5.0, 3.0),
                        child: Container(
                          width: double.infinity,
                          child: FittedBox(
                            alignment: AlignmentDirectional.centerStart,
                            fit: BoxFit.fitHeight,
                            child: Text(
                              '${model.name}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(13.0, 5.0, 5.0, 7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 5,
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
                            Expanded(
                              child: Container(
                                child: Text(
                                  '${model.distance} km',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
