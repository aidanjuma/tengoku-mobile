import 'package:http/http.dart';
import 'package:tengoku/src/models/anime_result.dart';

class ConsumetApiProvider {
  final Client _client = Client();

  // Endpoints
  static const String baseUrl = 'https://api.consumet.org';
  static const String anilistUrl = '$baseUrl/meta/anilist';

  /* Get Anime Search (https://api.consumet.org/meta/anilist/{query}) */
  Future<List<AnimeResult>> getAnimeSearch(
      String query, int page, int resultsPerPage) async {
    return [];
  }
}
