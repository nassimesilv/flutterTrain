import 'package:flutter/material.dart';

class Barber {
  String barberId;
  Image img;
  String name;
  String address;
  String distance;
  String rating;

  Barber(
      {@required this.barberId,
      @required this.name,
      this.img,
      this.address,
      this.distance,
      this.rating});
}
