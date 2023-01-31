import 'package:isar/isar.dart';
import 'item_title.dart';
import '../enums/media_status.dart';
import '../enums/media_format.dart';

part 'anime_result.g.dart';

@collection
class AnimeResult {
  Id isarId = Isar.autoIncrement;
  final int id;
  final ItemTitle title;
  String? coverImage;
  String? bannerImage;
  int? rating;
  int? releaseDate;
  String? relationType;

  @Enumerated(EnumType.ordinal32)
  MediaStatus? status;

  @Enumerated(EnumType.ordinal32)
  MediaFormat? format;

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
