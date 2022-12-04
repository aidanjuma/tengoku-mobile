import 'package:flutter/foundation.dart';
import 'package:tengoku/src/models/anime_episode.dart';
import 'package:tengoku/src/services/isar_service.dart';

class IsarProvider extends ChangeNotifier {
  final IsarService _service = IsarService();

  bool isLoading = false;

  /* For use at Episode Watch-Time (EWT) */
  AnimeEpisode? _currentlyWatching;
  AnimeEpisode? get currentlyWatching => _currentlyWatching;

  Future<void> returnEpisodeIfStored(AnimeEpisode episode) async {
    _setLoading(true);

    final AnimeEpisode? storedEpisode =
        await _service.returnEpisodeIfStored(episode.id);

    _currentlyWatching = storedEpisode;
    _setLoading(false);
  }

  Future<void> startWatchingEpisode(AnimeEpisode episode) async {
    _setLoading(true);
    await _service.startWatchingEpisode(episode);
    _setLoading(false);
  }

  Future<void> updateEpisodeProgress(
      AnimeEpisode episode, double progress) async {
    _setLoading(true);
    await _service.updateEpisodeProgress(episode.isarId, progress);
    _setLoading(false);
  }

  Future<void> deleteAllEpisodes() async {
    _setLoading(true);
    await _service.deleteAllEpisodes();
    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
