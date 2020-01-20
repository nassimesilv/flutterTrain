import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'barberProfilePictureGrid.dart';

class PhotoViewer extends StatelessWidget {
  static String title = 'photo_viewer';
  final List<GalleryItem> galleryItems;

  PhotoViewer({this.galleryItems});

  @override
  Widget build(BuildContext context) {
    final List<GalleryItem> galleryItems =
        ModalRoute.of(context).settings.arguments;

    return Container(
        child: PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: AssetImage(galleryItems[index].image),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
        );
      },
      itemCount: galleryItems.length,
    ));
  }
}

