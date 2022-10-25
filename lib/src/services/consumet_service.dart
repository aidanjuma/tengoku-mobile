import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:tengoku/src/types/title.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/utils/global.dart' as utils;

class ConsumetService {
  final Client _client = Client();

  // Endpoints
  static const String baseUrl = 'https://api.consumet.org';
  static const String anilistUrl = '$baseUrl/meta/anilist';

  /* Perform Basic Anime Search (https://api.consumet.org/meta/anilist/{query}) */
  Future<List<AnimeResult>?> basicAnimeSearch(
      String query, int? page, int? resultsPerPage) async {
    final Uri url =
        Uri.parse('$anilistUrl/$query?page=$page&perPage=$resultsPerPage');

    final Map<String, dynamic> results = await _makeGetRequest(() async {
      Response response = await _client.get(url);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['results'];
    });

    final List<AnimeResult> animes = _processResults(results);

    return animes;
  }

  /* Get Trending Anime (https://api.consumet.org/meta/anilist/trending) */
  Future<List<AnimeResult>?> getTrendingAnime(
      int? page, int? resultsPerPage) async {
    final Uri url =
        Uri.parse('$anilistUrl/trending?page=$page&perPage=$resultsPerPage');

    final Map<String, dynamic> results = await _makeGetRequest(() async {
      Response response = await _client.get(url);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['results'];
    });

    final List<AnimeResult> animes = _processResults(results);

    return animes;
  }

  // Network: Re-useable try-catch block for get requests.
  Future _makeGetRequest(Function request) async {
    try {
      return await request();
    } on SocketException catch (_) {
      throw 'Error whilst getting the data: no internet connection.';
    } on HttpException catch (_) {
      throw 'Error whilst getting the data: requested data could not be found.';
    } on FormatException catch (_) {
      throw 'Error whilst getting the data: bad format.';
    } on TimeoutException catch (_) {
      throw 'Error whilst getting the data: connection timed out.';
    } catch (err) {
      throw 'An error occurred whilst fetching the requested data: $err';
    }
  }

  List<AnimeResult> _processResults(Map<String, dynamic> results) {
    List<AnimeResult> animes = [];
    for (int i = 0; i < results.length; i++) {
      final item = results[i];
      final AnimeResult anime = AnimeResult(
        id: item['id'],
        title: Title(
          romaji: item['romaji'],
          english: item['english'],
          native: item['native'],
        ),
        albumImage: item['image'],
        coverImage: item['cover'],
        status: utils.evaluateMediaStatus(item['status']),
        rating: item['rating'],
        // MediaFormat? Find/check return from API.
        releaseDate: item['releaseDate'],
      );

      animes.add(anime);
    }

    return animes;
  }
}
