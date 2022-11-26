import 'package:flutter/material.dart';
import 'package:tengoku/src/types/genres.dart';
import 'package:tengoku/src/types/seasons.dart';
import 'package:tengoku/src/types/media_format.dart';
import 'package:tengoku/src/types/media_status.dart';
import 'package:tengoku/src/ui/views/info_view.dart';
import 'package:tengoku/src/models/anime_result.dart';

const Map<String, MediaStatus> mediaStatusOptions = {
  'Ongoing': MediaStatus.ongoing,
  'Completed': MediaStatus.completed,
  'Not yet aired': MediaStatus.notYetAired,
  'Hiatus': MediaStatus.hiatus,
  'Cancelled': MediaStatus.cancelled
};

const Map<String, MediaFormat> mediaFormatOptions = {
  'TV': MediaFormat.tv,
  'TV_SHORT': MediaFormat.tvShort,
  'MOVIE': MediaFormat.movie,
  'SPECIAL': MediaFormat.special,
  'OVA': MediaFormat.ova,
  'ONA': MediaFormat.ona,
  'MUSIC': MediaFormat.music,
  'MANGA': MediaFormat.manga,
  'NOVEL': MediaFormat.novel,
  'ONE_SHOT': MediaFormat.oneShot
};

const Map<String, Seasons> seasonsOptions = {
  'SPRING': Seasons.spring,
  'SUMMER': Seasons.summer,
  'FALL': Seasons.fall,
  'WINTER': Seasons.winter
};

const Map<String, Genres> stringToGenre = {
  'Action': Genres.action,
  'Adventure': Genres.adventure,
  'Cars': Genres.cars,
  'Comedy': Genres.comedy,
  'Drama': Genres.drama,
  'Ecchi': Genres.ecchi,
  'Fantasy': Genres.fantasy,
  'Horror': Genres.horror,
  'Mahou Shoujo': Genres.mahouShoujo,
  'Mecha': Genres.mecha,
  'Music': Genres.music,
  'Mystery': Genres.mystery,
  'Psychological': Genres.psychological,
  'Romance': Genres.romance,
  'Sci-Fi': Genres.sciFi,
  'Slice of Life': Genres.sliceOfLife,
  'Sports': Genres.sports,
  'Supernatural': Genres.supernatural,
  'Thriller': Genres.thriller
};

const Map<Genres, String> genreToString = {
  Genres.action: 'Action',
  Genres.adventure: 'Adventure',
  Genres.cars: 'Cars',
  Genres.comedy: 'Comedy',
  Genres.drama: 'Drama',
  Genres.ecchi: 'Ecchi',
  Genres.fantasy: 'Fantasy',
  Genres.horror: 'Horror',
  Genres.mahouShoujo: 'Mahou Shoujo',
  Genres.mecha: 'Mecha',
  Genres.music: 'Music',
  Genres.mystery: 'Mystery',
  Genres.psychological: 'Psychological',
  Genres.romance: 'Romance',
  Genres.sciFi: 'Sci-Fi',
  Genres.sliceOfLife: 'Slice of Life',
  Genres.sports: 'Sports',
  Genres.supernatural: 'Supernatural',
  Genres.thriller: 'Thriller',
  Genres.none: 'None'
};

final List<MediaFormat> unsupportedFormats = [
  MediaFormat.music,
  MediaFormat.novel,
  MediaFormat.unknown
];

final List<MediaStatus> unsupportedStatuses = [
  MediaStatus.notYetAired,
  MediaStatus.unknown
];

MediaStatus evaluateMediaStatus(String? rawStatus) {
  final MediaStatus? enumerated = mediaStatusOptions[rawStatus];
  return enumerated ?? MediaStatus.unknown;
}

MediaFormat evaluateMediaFormat(String? rawFormat) {
  final MediaFormat? enumerated = mediaFormatOptions[rawFormat];
  return enumerated ?? MediaFormat.unknown;
}

Seasons evaluateSeason(String? rawSeason) {
  final Seasons? enumerated = seasonsOptions[rawSeason];
  return enumerated ?? Seasons.unknown;
}

Genres evaluateGenre(String? rawGenre) {
  final Genres? enumerated = stringToGenre[rawGenre];
  return enumerated ?? Genres.none;
}

pushToInfoView(BuildContext context, AnimeResult data) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => InfoView(initialData: data),
    ),
  );
}

const String userAgent =
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36';
