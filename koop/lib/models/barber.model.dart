import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:koop/services/auth.service.dart';

class BarberModel {
  String barberId;
  String name;
  Address address;
  double distance;
  int likeCount;
  double rate;
  int reviewsCount;
  String imagePath;

  BarberModel(
      {@required this.barberId,
      @required this.name,
      this.address,
      this.distance,
      this.likeCount = 0,
      this.rate,
      this.reviewsCount = 0,
      this.imagePath});

  factory BarberModel.fromJson(Map<String, dynamic> json) {
    return BarberModel(
      barberId: json['barber_id'],
      name: json['name'],
      address: Address.fromJson(json['address']),
      distance: json['user_id'],
      likeCount: json['user_id'],
      rate: json['user_id'],
      reviewsCount: json['user_id'],
      imagePath: json['user_id'],
    );
  }

  calculateDistance(Position currentPosition) {

  }
}
