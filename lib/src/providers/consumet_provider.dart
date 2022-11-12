import 'package:flutter/foundation.dart';
import 'package:tengoku/src/models/anime_info.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/services/consumet_service.dart';

class ConsumetProvider extends ChangeNotifier {
  final ConsumetService _service = ConsumetService();

  bool isLoading = false;

  List<AnimeResult> _animeResults = [];
  List<AnimeResult> get animeResults => _animeResults;

  List<AnimeResult> _trendingAnime = [];
  List<AnimeResult> get trendingAnime => _trendingAnime;

  AnimeInfo? _currentAnimeInfo;
  AnimeInfo? get currentAnimeInfo => _currentAnimeInfo;

  Future<void> basicAnimeSearch(
      String query, int? page, int? resultsPerPage) async {
    isLoading = true;
    notifyListeners();

    final List<AnimeResult>? results =
        await _service.basicAnimeSearch(query, page, resultsPerPage);

    _animeResults = results!;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getTrendingAnime(int? page, int? resultsPerPage) async {
    isLoading = true;
    notifyListeners();

    final List<AnimeResult>? results =
        await _service.getTrendingAnime(page, resultsPerPage);

    _trendingAnime = results!;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getAnimeInfoWithEpisodes(int id, String? provider) async {
    isLoading = true;
    notifyListeners();

    final AnimeInfo animeInfo =
        await _service.getAnimeInfoWithEpisodes(id, provider);

    _currentAnimeInfo = animeInfo;
    isLoading = false;
    notifyListeners();
  }
}
