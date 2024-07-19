import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

part 'gallery_item.dart';

class GalleryPhotoViewWidget extends StatefulWidget {
  GalleryPhotoViewWidget(
      {super.key,
      this.loadingBuilder,
      this.backgroundDecoration,
      this.minScale,
      this.maxScale,
      required this.initialIndex,
      required this.galleryItems,
      required this.scrollDirection})
      : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<GalleryItem> galleryItems;
  final Axis scrollDirection;

  @override
  State<GalleryPhotoViewWidget> createState() => _GalleryPhotoViewWidgetState();
}

class _GalleryPhotoViewWidgetState extends State<GalleryPhotoViewWidget> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: widget.galleryItems.length,
              loadingBuilder: widget.loadingBuilder,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '${currentIndex + 1}/${widget.galleryItems.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  decoration: null,
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).viewPadding.top + 15,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const SizedBox(
                    width: 30,
                    height: 30,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final GalleryItem item = widget.galleryItems[index];
    return item.isSvg
        ? PhotoViewGalleryPageOptions.customChild(
            child: SizedBox(
              width: 300,
              height: 300,
              child: SvgPicture.asset(
                item.resource,
                height: 200.0,
              ),
            ),
            childSize: const Size(300, 300),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.covered * 4.1,
            heroAttributes: PhotoViewHeroAttributes(tag: item.id),
          )
        : PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(item.resource),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.covered * 4.1,
            heroAttributes: PhotoViewHeroAttributes(tag: item.id),
          );
  }
}
