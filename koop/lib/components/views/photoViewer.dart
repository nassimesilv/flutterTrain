import 'package:flutter/material.dart';
import 'package:koop/models/barberGallery.model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewer extends StatefulWidget {
  PhotoViewer({
    this.loadingChild,
    this.backgroundDecoration,
    this.initialIndex,
    @required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final Widget loadingChild;
  final Decoration backgroundDecoration;
  final int initialIndex;
  final PageController pageController;
  final List<BarberGalleryItemModel> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _PhotoViewerState();
  }
}

class _PhotoViewerState extends State<PhotoViewer> {
  int currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onVerticalDragEnd: (DragEndDetails details) {
            if (details.velocity.pixelsPerSecond.dy > 0) {
              Navigator.pop(context);
            }
          },
          child: Container(
            decoration: widget.backgroundDecoration,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: _buildItem,
                  itemCount: widget.galleryItems.length,
                  loadingChild: widget.loadingChild,
                  backgroundDecoration: widget.backgroundDecoration,
                  pageController: widget.pageController,
                  onPageChanged: onPageChanged,
                  scrollDirection: widget.scrollDirection,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Image ${currentIndex + 1}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      decoration: null,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final BarberGalleryItemModel item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: AssetImage(item.imagePath),
      heroAttributes: PhotoViewHeroAttributes(tag: item.itemId),
    );
  }
}

void openPhotoViewer(BuildContext context, final int index,
    List<BarberGalleryItemModel> galleryItems, bool isVerticalGallery) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PhotoViewer(
        galleryItems: galleryItems,
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
        initialIndex: index,
        scrollDirection: isVerticalGallery ? Axis.vertical : Axis.horizontal,
      ),
    ),
  );
}
