import 'package:flutter/material.dart';

class BarberInfoModel {
  String barberId;
  String description;
  String address;
  double lat;
  double lng;
  String phoneNumber;
  String website;
  String mailAddress;

  BarberInfoModel(
      {@required this.barberId,
      this.description,
      this.address,
      this.lat,
      this.lng,
      this.phoneNumber,
      this.website,
      this.mailAddress});
}
