import '../types/title.dart';
import '../types/media_status.dart';
import '../types/media_format.dart';

class AnimeResult {
  final String id;
  final Title title;
  String? albumImage;
  String? coverImage;
  MediaStatus? status;
  int? rating;
  MediaFormat? format;
  String? releaseDate;

  AnimeResult({
    required this.id,
    required this.title,
    this.albumImage,
    this.coverImage,
    this.status,
    this.rating,
    this.format,
    this.releaseDate,
  });
}
