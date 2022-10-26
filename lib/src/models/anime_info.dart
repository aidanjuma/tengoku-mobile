import 'anime_result.dart';
import '../types/sub_or_dub.dart';
import '../types/seasons.dart';

class AnimeInfo extends AnimeResult {
  String? malId;
  List<String>? genres;
  String? description;
  int? episodeCount;
  SubOrDub? subOrDub;
  List<String>? synonyms;
  // 2 character representation for country of origin, e.g. JP for Japan.
  String? originCountry;
  bool? isAdult;
  bool? isLicensed;
  Seasons? season;
  List<String>? studios;
  String? color;
  // TODO: Episodes (AnimeEpisode model)
  AnimeResult? recommendations;
  AnimeResult? relations;

  AnimeInfo({
    required super.id,
    required super.title,
    super.coverImage,
    super.bannerImage,
    super.status,
    super.rating,
    super.format,
    super.releaseDate,
    this.malId,
    this.genres,
    this.description,
    this.episodeCount,
    this.subOrDub,
    this.synonyms,
    this.originCountry,
    this.isAdult,
    this.isLicensed,
    this.season,
    this.studios,
    this.color,
    this.recommendations,
    this.relations,
  });
}
