import '../types/title.dart';
import '../types/media_status.dart';
import '../types/media_format.dart';

class AnimeResult {
  final String id;
  final Title title;
  String? url;
  String? albumImage;
  String? coverImage;
  MediaStatus? status;
  double? rating;
  MediaFormat? format;
  String? releaseDate;

  AnimeResult({
    required this.id,
    required this.title,
    this.url,
    this.albumImage,
    this.coverImage,
    this.status,
    this.rating,
    this.format,
    this.releaseDate,
  });
}
