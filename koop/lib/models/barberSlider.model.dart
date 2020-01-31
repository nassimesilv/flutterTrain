
import 'dart:convert';

import 'barber.model.dart';

class BarberSliderModel {
  String sliderTitle;
  List<BarberModel> barberCardList;

  BarberSliderModel({this.sliderTitle, this.barberCardList});

  factory BarberSliderModel.fromJson(Map<String, dynamic> json) {
    return BarberSliderModel(
      sliderTitle: json['title'],
      barberCardList: jsonDecode(json['barberList']).map((barber) => BarberModel.fromJson(barber)) ,
    );
  }
}