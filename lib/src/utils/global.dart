import 'package:flutter/material.dart';
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
  'ONE_SHOT': MediaFormat.oneShot,
};

const Map<String, SubOrDub> subOrDubOptions = {
  'sub': SubOrDub.sub,
  'dub': SubOrDub.dub,
  'both': SubOrDub.both,
};

const Map<String, Seasons> seasonsOptions = {
  'SPRING': Seasons.spring,
  'SUMMER': Seasons.summer,
  'FALL': Seasons.fall,
  'WINTER': Seasons.winter,
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
  return enumerated;
}

Seasons? evaluateSeason(String? rawSeason) {
  final Seasons? enumerated = seasonsOptions[rawSeason];
  return enumerated;
}

pushToInfoView(BuildContext context, AnimeResult data) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => InfoView(initialData: data),
    ),
  );
}
