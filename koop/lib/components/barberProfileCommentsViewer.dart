import 'package:flutter/material.dart';
import 'package:koop/utils/constants.dart';
import 'package:random_color/random_color.dart';

class BarberProfileCommentsViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BarberProfileComment extends StatelessWidget {
  final RandomColor _randomColor = RandomColor();
  final String initials;
  final String rating;
  final String commentText;

  BarberProfileComment({this.initials, this.commentText, this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              radius: 30.0,
              backgroundColor: _randomColor.randomColor(),
              child: Text(this.initials),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: kRatingStarColor,
                        size: 15,
                      ),
                      Text(
                        '$rating',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Container(width: double.infinity, child: Text(this.commentText, textAlign: TextAlign.start, style: TextStyle())),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
