import 'package:flutter/foundation.dart';
import 'package:tengoku/src/utils/stack.dart';
import 'package:tengoku/src/models/source.dart';
import 'package:tengoku/src/models/anime_info.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/models/anime_episode.dart';
import 'package:tengoku/src/models/info_view_cache.dart';
import 'package:tengoku/src/services/consumet_service.dart';

class ConsumetProvider extends ChangeNotifier {
  final ConsumetService _service = ConsumetService();

  bool isInitialized = false;
  bool isLoading = false;

  /* Providers */
  final String _animeProvider = 'gogoanime';
  String get animeProvider => _animeProvider;
  final String _mangaProvider = 'mangasee123';
  String get mangaProvider => _mangaProvider;

  /* Search */
  String _latestQuery = '';
  String get latestQuery => _latestQuery;
  List<AnimeResult>? _animeResults;
  List<AnimeResult>? get animeResults => _animeResults;

  /* Discover */
  List<AnimeResult>? _trendingAnime;
  List<AnimeResult>? get trendingAnime => _trendingAnime;
  List<AnimeResult>? _popularAnime;
  List<AnimeResult>? get popularAnime => _popularAnime;

  /* Info */
  AnimeResult? _selectedAnime;
  AnimeResult? get selectedAnime => _selectedAnime;
  AnimeInfo? _currentAnimeInfo;
  AnimeInfo? get currentAnimeInfo => _currentAnimeInfo;
  final Stack<InfoViewCache> _infoViewCacheStack = Stack<InfoViewCache>();
  Stack<InfoViewCache> get infoViewCacheStack => _infoViewCacheStack;

  /* Watch */
  AnimeEpisode? _selectedEpisode;
  AnimeEpisode? get selectedEpisode => _selectedEpisode;
  Source? _currentEpisodeSource;
  Source? get currentEpisodeSource => _currentEpisodeSource;

  Future<void> basicAnimeSearch(
      String query, int? page, int? resultsPerPage) async {
    _setLoading(true);

    // Perform search, save results & update latest query.
    final List<AnimeResult>? results =
        await _service.basicAnimeSearch(query, page, resultsPerPage);
    _animeResults = results;
    _latestQuery = query;

    _setLoading(false);
  }

  Future<void> getTrendingAnime(int? page, int? resultsPerPage) async {
    _setLoading(true);

    // Get trending anime & update results.
    final List<AnimeResult>? results =
        await _service.getTrendingAnime(page, resultsPerPage);
    _trendingAnime = results;

    _setLoading(false);
  }

  Future<void> getPopularAnime(int? page, int? resultsPerPage) async {
    _setLoading(true);

    // Get popular anime & update results.
    final List<AnimeResult>? results =
        await _service.getPopularAnime(page, resultsPerPage);
    _popularAnime = results;

    _setLoading(false);
  }

  Future<void> selectAnimeAndGetInfo(AnimeResult anime) async {
    _setLoading(true);

    // Update selected anime, get info for it, update current anime info & push to stack.
    _selectedAnime = anime;
    final AnimeInfo animeInfo =
        await _service.getAnimeInfoWithEpisodes(anime.id, _animeProvider);
    _currentAnimeInfo = animeInfo;
    _infoViewCacheStack.push(
      InfoViewCache(
        animeInfo: _currentAnimeInfo!,
        animeResult: _selectedAnime!,
      ),
    );

    _setLoading(false);
  }

  void replaceAnimeInfoWithPrevious() {
    _setLoading(true);

    // Pop info item from stack & update current anime info with queue.first's value.
    _infoViewCacheStack.pop();

    if (_infoViewCacheStack.queue.isNotEmpty) {
      final InfoViewCache previous = _infoViewCacheStack.queue.first;
      _selectedAnime = previous.animeResult;
      _currentAnimeInfo = previous.animeInfo;
    }

    _setLoading(false);
  }

  Future<void> selectEpisodeAndGetStreamingLinks(AnimeEpisode episode) async {
    _setLoading(true);

    // Update selected episode, get streaming links & update current episode source.
    _selectedEpisode = episode;
    final Source? episodeSource =
        await _service.getStreamingLinksFromEpisodeId(episode.id);
    _currentEpisodeSource = episodeSource;

    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    value == true && isInitialized == false ? isInitialized = true : null;
    notifyListeners();
  }
}
