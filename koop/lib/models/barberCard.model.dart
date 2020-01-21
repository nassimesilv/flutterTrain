import 'package:flutter/material.dart';

class BarberCard {
  String name;
  String address;
  double distance;
  double rating;

  BarberCard({
    @required this.name,
    this.address,
    this.distance,
    this.rating,
  });
}