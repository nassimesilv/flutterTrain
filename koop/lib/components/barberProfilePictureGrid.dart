import 'package:flutter/material.dart';
import 'package:koop/components/photoViewer.dart';

class BarberProfilePictureGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
        children: getGalleryImages(context),
        crossAxisCount: 3,
      ),
    );
  }
}

class GalleryItem {
  final String id;
  final String image;

  GalleryItem({this.id, this.image});
}

List<GalleryItem> getGalleryItems() {
  List<GalleryItem> galleryItem = [];

  for (int i = 0; i < 20; i++) {
    galleryItem.add(GalleryItem(
        id: i.toString(), image: 'images/fakeBarberImage${i % 3}.jpg'));
  }

  return galleryItem;
}

List<Container> getGalleryImages(BuildContext context) {
  List<GalleryItem> galleryItem = getGalleryItems();
  List<Container> list = [];

  for (var item in galleryItem) {
    list.add(Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, PhotoViewer.title,
              arguments: galleryItem);
        },
        child: Hero(
          tag: item.id,
          child: FittedBox(
            child: Image.asset(item.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }

  return list;
}

