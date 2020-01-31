import 'package:flutter/material.dart';

class BarberComment {
  String commentId;
  String initials;
  String rating;
  String commentText;
  String date;

  BarberComment({
    @required this.commentId,
    @required this.initials,
    @required this.rating,
    this.commentText,
    this.date,
  });
}
