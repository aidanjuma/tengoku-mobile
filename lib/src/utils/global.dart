import 'package:flutter/material.dart';
import 'package:tengoku/src/types/genres.dart';
import 'package:tengoku/src/types/seasons.dart';
import 'package:tengoku/src/types/sub_or_dub.dart';
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

const Map<String, SubOrDub> subOrDubOptions = {
  'sub': SubOrDub.sub,
  'dub': SubOrDub.dub,
  'both': SubOrDub.both
};

const Map<String, Seasons> seasonsOptions = {
  'SPRING': Seasons.spring,
  'SUMMER': Seasons.summer,
  'FALL': Seasons.fall,
  'WINTER': Seasons.winter
};

const Map<String, Genres> genresOptions = {
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

MediaStatus evaluateMediaStatus(String? rawStatus) {
  final MediaStatus? enumerated = mediaStatusOptions[rawStatus];
  return enumerated ?? MediaStatus.unknown;
}

MediaFormat evaluateMediaFormat(String? rawFormat) {
  final MediaFormat? enumerated = mediaFormatOptions[rawFormat];
  return enumerated ?? MediaFormat.unknown;
}

SubOrDub? evaluateSubOrDub(String? rawSubOrDub) {
  final SubOrDub? enumerated = subOrDubOptions[rawSubOrDub];
  return enumerated ?? SubOrDub.unknown;
}

Seasons evaluateSeason(String? rawSeason) {
  final Seasons? enumerated = seasonsOptions[rawSeason];
  return enumerated ?? Seasons.unknown;
}

Genres evaluateGenre(String? rawGenre) {
  final Genres? enumerated = genresOptions[rawGenre];
  return enumerated ?? Genres.none;
}

pushToInfoView(BuildContext context, AnimeResult data) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => InfoView(initialData: data),
    ),
  );
}
