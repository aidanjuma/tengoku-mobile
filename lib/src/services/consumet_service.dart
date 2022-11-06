import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:tengoku/src/types/item_title.dart';
import 'package:tengoku/src/models/anime_info.dart';
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

    final List<dynamic> results = await _makeGetRequest(() async {
      Response response = await _client.get(url);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['results'];
    });

    final List<AnimeResult>? animes = _processResults(results);

    return animes;
  }

  /* Get Trending Anime (https://api.consumet.org/meta/anilist/trending) */
  Future<List<AnimeResult>?> getTrendingAnime(
      int? page, int? resultsPerPage) async {
    final Uri url =
        Uri.parse('$anilistUrl/trending?page=$page&perPage=$resultsPerPage');

    final List<dynamic> results = await _makeGetRequest(() async {
      Response response = await _client.get(url);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['results'];
    });

    final List<AnimeResult>? animes = _processResults(results);

    return animes;
  }

  /* Get Anime Info (incl. Episodes) (https://api.consumet.org/meta/anilist/info/{id}) */
  Future<AnimeInfo> getAnimeInfoWithEpisodes(
      String id, String? provider) async {
    final Uri url = Uri.parse('$anilistUrl/info/$id?provider=$provider');

    final Map<String, dynamic> data = await _makeGetRequest(() async {
      Response response = await _client.get(url);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data;
    });

    final AnimeInfo animeInfo = AnimeInfo(
      id: id,
      title: ItemTitle(
        english: data['title']['english'],
        romaji: data['title']['romaji'],
        native: data['title']['native'],
      ),
      coverImage: data['image'],
      bannerImage: data['cover'],
      status: utils.evaluateMediaStatus(data['status']),
      rating: data['rating'],
      format: utils.evaluateMediaFormat(data['type']),
      releaseDate: data['releaseDate'],
      malId: data['malId'],
      genres: data['genres'],
      description: data['description'],
      episodeCount: data['totalEpisodes'],
      subOrDub: utils.evaluateSubOrDub(data['subOrDub']),
      synonyms: data['synonyms'],
      originCountry: data['countryOfOrigin'],
      isAdult: data['isAdult'],
      isLicensed: data['isLicensed'],
      season: utils.evaluateSeason(data['season']),
      studios: data['studios'],
      color: data['color'],
      // TODO: Episodes (implement _processEpisodes or similar)
      recommendations: _processResults(data['recommendations']),
      relations: _processResults(data['relations']),
    );

    return animeInfo;
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

  List<AnimeResult>? _processResults(List<dynamic> results) {
    List<AnimeResult> animes = [];
    for (int i = 0; i < results.length; i++) {
      final item = results[i];
      final AnimeResult anime = AnimeResult(
        id: item['id'],
        title: ItemTitle(
          romaji: item['title']['romaji'],
          english: item['title']['english'],
          native: item['title']['native'],
          userPreferred: item['title']['userPreferred'],
        ),
        coverImage: item['image'],
        bannerImage: item['cover'],
        status: utils.evaluateMediaStatus(item['status']),
        rating: item['rating'],
        format: utils.evaluateMediaFormat(item['type']),
        releaseDate: item['releaseDate'] is String
            ? int.parse(item['releaseDate'])
            : item['releaseDate'],
      );

      animes.add(anime);
    }

    return animes;
  }
}
