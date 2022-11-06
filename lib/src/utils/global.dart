import 'package:flutter/material.dart';
import 'package:tengoku/src/types/media_status.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/ui/views/info_view.dart';

const Map<String, MediaStatus> mediaStatusData = {
  'Ongoing': MediaStatus.ongoing,
  'Completed': MediaStatus.completed,
  'Not yet aired': MediaStatus.notYetAired,
  'Hiatus': MediaStatus.hiatus,
  'Cancelled': MediaStatus.cancelled
};

MediaStatus evaluateMediaStatus(String? rawStatus) {
  final MediaStatus? enumerated = mediaStatusData[rawStatus];
  return enumerated ?? MediaStatus.unknown;
}

pushToInfoView(BuildContext context, AnimeResult data) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => InfoView(initialData: data),
    ),
  );
}
