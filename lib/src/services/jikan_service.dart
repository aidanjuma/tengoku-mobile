import 'package:http/http.dart';
import 'package:tengoku/src/utils/requests.dart' as requests;

class JikanService {
  final Client _client = Client();

  static const String baseUrl = 'https://api.jikan.moe/v4';

  // TODO: Model Jikan Anime Response & getUpcomingAnime.
  Future<List> getUpcomingAnime() async {
    return [];
  }
}
