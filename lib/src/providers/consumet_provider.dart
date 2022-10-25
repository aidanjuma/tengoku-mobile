import 'package:flutter/foundation.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/services/consumet_service.dart';

class ConsumetProvider extends ChangeNotifier {
  final ConsumetService _service = ConsumetService();

  bool isLoading = false;

  List<AnimeResult> _animeSearchResults = [];
  List<AnimeResult> get animeSearchResults => _animeSearchResults;

  List<AnimeResult> _trendingAnime = [];
  List<AnimeResult> get trendingAnime => _trendingAnime;

  Future<void> basicAnimeSearch(
      String query, int? page, int? resultsPerPage) async {
    isLoading = true;
    notifyListeners();

    final results =
        await _service.basicAnimeSearch(query, page, resultsPerPage);

    _animeSearchResults = results!;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getTrendingAnime(int? page, int? resultsPerPage) async {
    isLoading = true;
    notifyListeners();

    final results = await _service.getTrendingAnime(page, resultsPerPage);

    _trendingAnime = results!;
    isLoading = false;
    notifyListeners();
  }
}
