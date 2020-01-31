import 'package:flutter/material.dart';

class BarberGalleryModel {
  final String galleryId;
  final List<BarberGalleryItemModel> gallery;

  BarberGalleryModel({
    @required this.galleryId,
    @required this.gallery,
  });
}

class BarberGalleryItemModel {
  final String itemId;
  final String imagePath;

  BarberGalleryItemModel({
    @required this.itemId,
    @required this.imagePath,
  });
}
