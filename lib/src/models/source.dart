import 'video.dart';
import 'subtitle.dart';
import 'intro_timings.dart';

class Source {
  final List<Video> videos;
  List<Subtitle>? subtitles;
  IntroTimings? introTimings;
  Map<String, String>? headers;

  Source({
    required this.videos,
    this.subtitles,
    this.introTimings,
    this.headers,
  });
}
