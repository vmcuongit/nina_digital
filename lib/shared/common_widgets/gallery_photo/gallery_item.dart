part of 'gallery_photo_view_widget.dart';

class GalleryItem {
  GalleryItem({
    required this.id,
    this.name,
    required this.resource,
    this.isSvg = false,
  });

  final String id;
  final String? name;
  final String resource;
  final bool isSvg;
}
