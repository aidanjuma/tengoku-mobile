// "Minimum" - only contains information required by Tengoku, not all supplied by Jikan.
import 'trailer.dart';
import 'jikan_image.dart';

class MinimumJikanAnimeResult {
  final String malId;
  final String url;
  final List<JikanImage> images;
  Trailer? trailer;
  // TODO: https://github.com/aidanjuma/tengoku.stream/blob/master/src/models/types.ts

  MinimumJikanAnimeResult({
    required this.malId,
    required this.url,
    required this.images,
    this.trailer,
  });
}
