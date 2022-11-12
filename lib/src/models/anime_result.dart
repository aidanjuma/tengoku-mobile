import '../types/item_title.dart';
import '../types/media_status.dart';
import '../types/media_format.dart';

class AnimeResult {
  final int id;
  final ItemTitle title;
  String? coverImage;
  String? bannerImage;
  MediaStatus? status;
  int? rating;
  MediaFormat? format;
  int? releaseDate;
  String? relationType;

  AnimeResult({
    required this.id,
    required this.title,
    this.coverImage,
    this.bannerImage,
    this.status,
    this.rating,
    this.format,
    this.releaseDate,
    this.relationType,
  });
}
