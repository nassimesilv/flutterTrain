import 'package:flutter/material.dart';
import 'package:koop/components/bars/circleAvatarBar.dart';
import 'package:koop/components/buttons/simpleButton.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:koop/models/barber.model.dart';
import 'package:koop/utils/constants.dart';
import 'package:like_button/like_button.dart';

class BarberProfileBar extends StatelessWidget {
  final TabController tabController;
  final BarberModel model;

  BarberProfileBar({this.tabController, this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: MediaQuery.of(context).size.height *
                  kBarberProfilePictureSizeRatio,
              width: MediaQuery.of(context).size.height *
                  kBarberProfilePictureSizeRatio,
              child: FavoriteSquareAvatar(
                image: Image.asset(model.imagePath),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RatingBarIndicator(
                        rating: model.rate,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        direction: Axis.horizontal,
                      ),
                      LikeButton(
                        size: MediaQuery.of(context).size.height * kBarberCardIconSizeRatio,
                        circleColor: CircleColor(
                            start: Colors.pink,
                            end: Theme.of(context).accentColor),
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
                                  size:
                                      MediaQuery.of(context).size.height * kBarberCardIconSizeRatio,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Theme.of(context).accentColor,
                                  size:
                                      MediaQuery.of(context).size.height * kBarberCardIconSizeRatio,
                                );
                        },
                        likeCount: model.likeCount,
                        countBuilder: (int count, bool isLiked, String text) {
                          Widget result;
                          if (count == 0) {
                            result = Text(
                              "",
                            );
                          } else
                            result = Text(
                              text,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .title
                                      .color),
                            );
                          return result;
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              '${model.reviewsCount}',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'Avis',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: SimpleButton(
                      label: 'Prendre un RDV',
                      onPressed: () {
                        this.tabController.animateTo(1);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: kSizedBoxSize,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
