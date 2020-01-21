import 'package:flutter/material.dart';
import 'package:koop/components/cards/commentCard.dart';

class CommentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getCommentsList(),
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
    ),
    CommentCard(
      initials: 'YK',
      rating: 3.5.toString(),
      commentText: 'Passable',
    ),
    CommentCard(
      initials: 'YK',
      rating: 3.5.toString(),
      commentText: 'Passable',
    ),
    CommentCard(
      initials: 'YK',
      rating: 3.5.toString(),
      commentText: 'Passable',
    ),
    CommentCard(
      initials: 'YK',
      rating: 3.5.toString(),
      commentText: 'Passable',
    )
  ];
  return commentsList;
}