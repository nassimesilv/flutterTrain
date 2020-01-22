import 'package:flutter/material.dart';
import 'package:koop/components/buttons/simpleButton.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:koop/utils/constants.dart';
import 'package:koop/screens/barber_profile_screen.dart';
import 'package:like_button/like_button.dart';

class BarberProfileBar extends StatelessWidget {
  final TabController tabController;

  BarberProfileBar({this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          BarberSquareAvatar(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RatingBarIndicator(
                      rating: 3.75,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),
                    LikeButton(
                      size: MediaQuery.of(context).size.height * 0.04,
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
                                size: MediaQuery.of(context).size.height * 0.04,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Theme.of(context).accentColor,
                                size: MediaQuery.of(context).size.height * 0.04,
                              );
                      },
                      likeCount: 100,
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
                    Column(
                      children: <Widget>[
                        Text(
                          '100',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Avis',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SimpleButton(
                    label: 'Prendre un RDV',
                    onPressed: () {
                      this.tabController.animateTo(1);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BarberCircleAvatar extends StatelessWidget {
  final Image image;

  BarberCircleAvatar({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
          minRadius: 20.0,
          maxRadius: 40.0,
          child: ClipOval(child: Image.asset('images/fakeCircleAvatar.jpg'))
          //TODO Add background Image
          ),
    );
  }
}

class BarberSquareAvatar extends StatelessWidget {
  final Image image;

  BarberSquareAvatar({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Container(
        margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 10.0),
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kCardBorderRadius),
          color: Theme.of(context).accentColor,
          shape: BoxShape.rectangle,
        ),
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
    );
  }
}
