import 'package:tengoku/src/enums/image_type.dart';

class JikanImage {
  final ImageType imageType;
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;
  // Trailer-exclusive:
  String? mediumImageUrl;
  String? maximumImageUrl;

  JikanImage({
    required this.imageType,
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
    this.mediumImageUrl,
    this.maximumImageUrl,
  });
}
