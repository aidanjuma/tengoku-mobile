import 'package:isar/isar.dart';
import 'package:flutter/foundation.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/models/anime_episode.dart';
import 'package:tengoku/src/services/isar_service.dart';

class IsarProvider extends ChangeNotifier {
  final Isar isar;
  late IsarService _service;

  IsarProvider(this.isar) {
    _service = IsarService(isar: isar);
  }

  bool isInitialized = false;
  bool isLoading = false;

  AnimeResult? _currentAnime;
  AnimeResult? get currentAnime => _currentAnime;

  AnimeEpisode? _currentEpisode;
  AnimeEpisode? get currentEpisode => _currentEpisode;

  /* List of episodes that user is currently watching. */
  List<AnimeEpisode> _currentlyWatching = [];
  List<AnimeEpisode> get currentlyWatching => _currentlyWatching;

  Future<void> saveAnimeResult(AnimeResult animeResult) async {
    _setLoading(true);
    await _service.saveAnimeResult(animeResult);
    _currentAnime = animeResult;
    _setLoading(false);
  }

  Future<void> setCurrentAnimeIfStored(int isarId) async {
    _setLoading(true);

    final AnimeResult? animeResult =
        await _service.returnAnimeResultIfStored(isarId);

    _currentAnime = animeResult;
    _setLoading(false);
  }

  Future<void> returnEpisodeIfStored(AnimeEpisode episode) async {
    _setLoading(true);

    final AnimeEpisode? storedEpisode =
        await _service.returnEpisodeIfStored(episode.episodeId);

    _currentEpisode = storedEpisode;
    _setLoading(false);
  }

  Future<void> startWatchingEpisode(AnimeEpisode episode) async {
    _setLoading(true);

    episode.parentIsarId = _currentAnime?.isarId;
    final AnimeEpisode currentEpisode =
        await _service.startWatchingEpisode(episode);

    _currentEpisode = currentEpisode;
    _setLoading(false);
  }

  Future<void> addEpisodeDuration(
      Id episodeIsarId, int durationInSeconds) async {
    _setLoading(true);
    await _service.addEpisodeDuration(episodeIsarId, durationInSeconds);
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

  Future<void> getListOfCurrentlyWatching() async {
    _setLoading(true);
    final List<AnimeEpisode> currentlyWatching =
        await _service.getListOfCurrentlyWatching();

    _currentlyWatching = currentlyWatching;
    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    value == true && isInitialized == false ? isInitialized = true : null;
    notifyListeners();
  }
}
