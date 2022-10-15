import 'package:tengoku/src/types/media_status.dart';

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
