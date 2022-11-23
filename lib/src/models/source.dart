import 'video.dart';
import 'subtitle.dart';
import 'intro_timings.dart';

class Source {
  final List<Video> sources;
  List<Subtitle>? subtitles;
  IntroTimings? introTimings;
  Map<String, String>? headers;

  Source({
    required this.sources,
    this.subtitles,
    this.introTimings,
    this.headers,
  });
}
