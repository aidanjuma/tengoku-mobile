import 'package:flutter/foundation.dart';
import 'package:tengoku/src/models/source.dart';
import 'package:tengoku/src/models/anime_info.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/services/consumet_service.dart';

class ConsumetProvider extends ChangeNotifier {
  final ConsumetService _service = ConsumetService();

  bool isInitialized = false;
  bool isLoading = false;

  /* Search */
  String _latestQuery = '';
  String get latestQuery => _latestQuery;
  List<AnimeResult> _animeResults = [];
  List<AnimeResult> get animeResults => _animeResults;

  /* Discover */
  List<AnimeResult> _trendingAnime = [];
  List<AnimeResult> get trendingAnime => _trendingAnime;
  List<AnimeResult> _popularAnime = [];
  List<AnimeResult> get popularAnime => _popularAnime;

  /* Info */
  AnimeInfo? _currentAnimeInfo;
  AnimeInfo? get currentAnimeInfo => _currentAnimeInfo;

  /* Watch */
  Source? _currentAnimeSource;
  Source? get currentAnimeSource => _currentAnimeSource;

  Future<void> basicAnimeSearch(
      String query, int? page, int? resultsPerPage) async {
    _setLoading(true);

    final List<AnimeResult>? results =
        await _service.basicAnimeSearch(query, page, resultsPerPage);

    _animeResults = results!;
    _latestQuery = query;
    _setLoading(false);
  }

  Future<void> getTrendingAnime(int? page, int? resultsPerPage) async {
    _setLoading(true);

    final List<AnimeResult>? results =
        await _service.getTrendingAnime(page, resultsPerPage);

    _trendingAnime = results!;
    _setLoading(false);
  }

  Future<void> getPopularAnime(int? page, int? resultsPerPage) async {
    _setLoading(true);

    final List<AnimeResult>? results =
        await _service.getPopularAnime(page, resultsPerPage);

    _popularAnime = results!;
    _setLoading(false);
  }

  Future<void> getAnimeInfoWithEpisodes(int id, String? provider) async {
    _setLoading(true);

    final AnimeInfo animeInfo =
        await _service.getAnimeInfoWithEpisodes(id, provider);

    _currentAnimeInfo = animeInfo;
    _setLoading(false);
  }

  Future<void> getStreamingLinksFromEpisodeId(String episodeId) async {
    _setLoading(true);

    final Source? animeSource =
        await _service.getStreamingLinksFromEpisodeId(episodeId);

    _currentAnimeSource = animeSource;
    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    value == true && isInitialized == false ? isInitialized = true : null;
    notifyListeners();
  }
}
