import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:random_color/random_color.dart';

class CommentCard extends StatelessWidget {
  final RandomColor _randomColor = RandomColor();
  final String initials;
  final String rating;
  final String commentText;

  CommentCard({this.initials, this.commentText, this.rating});

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
                      RatingBarIndicator(
                        rating: double.parse(rating),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Container(
                      width: double.infinity,
                      child: Text(this.commentText,
                          textAlign: TextAlign.start, style: TextStyle())),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
