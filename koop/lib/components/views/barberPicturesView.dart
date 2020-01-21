import 'package:flutter/material.dart';
import 'package:koop/components/views/photoViewer.dart';
import 'package:koop/models/galleryItem.model.dart';

const double gridSpacing = 2.0;

class BarberPicturesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        mainAxisSpacing: gridSpacing,
        crossAxisSpacing: gridSpacing,
        children: getGalleryCards(context),
        crossAxisCount: 3,
      ),
    );
  }
}



List<GalleryItem> getGalleryItems() {
  // TODO: Handle instagram and backen images
  List<GalleryItem> galleryItem = [];

  for (int i = 0; i < 20; i++) {
    galleryItem.add(GalleryItem(
        id: i.toString(), image: 'images/fakeBarberImage${i % 3}.jpg'));
  }

  return galleryItem;
}

List<Container> getGalleryCards(BuildContext context) {
  List<GalleryItem> galleryItems = getGalleryItems();
  List<Container> list = [];
  
  for (int i = 0; i < galleryItems.length; i++) {
    list.add(
      Container(
        child: GestureDetector(
          onTap: () {
            openPhotoViewer(context, i, galleryItems, false);
          },
          child: Hero(
            tag: galleryItems[i].id,
            child: FittedBox(
              child: Image.asset(galleryItems[i].image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  return list;
}
