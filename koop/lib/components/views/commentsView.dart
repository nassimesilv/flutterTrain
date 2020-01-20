import 'package:flutter/material.dart';
import 'package:koop/utils/constants.dart';
import 'package:random_color/random_color.dart';

class CommentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

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

List<CommentCard> getCommentsList() {
  List<CommentCard> commentsList = [
    CommentCard(
      initials: 'SB',
      rating: 3.5.toString(),
      commentText: 'Barber de fou rien a redire',
    ),
    CommentCard(
      initials: 'ND',
      rating: 2.9.toString(),
      commentText: 'Nul nul nul!',
    ),
    CommentCard(
      initials: 'ME',
      rating: 5.toString(),
      commentText:
          'Les contours sont carre satisfait du taff du bon vieu ferufvhwevfhiwdfvbowiefvbiewrvbervewrvewve',
    ),
    CommentCard(
      initials: 'AS',
      rating: 4.5.toString(),
      commentText: 'Parfait!',
    ),
    CommentCard(
      initials: 'YK',
      rating: 3.5.toString(),
      commentText: 'Passable',
    )
  ];
  return commentsList;
}