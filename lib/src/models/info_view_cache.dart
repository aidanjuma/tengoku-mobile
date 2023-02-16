import 'anime_info.dart';
import 'anime_result.dart';
import 'anime_episode.dart';

class InfoViewCache {
  AnimeInfo animeInfo;
  AnimeResult animeResult;
  List<List<AnimeEpisode>>? episodePages;

  InfoViewCache({
    required this.animeInfo,
    required this.animeResult,
    this.episodePages,
  });
}
