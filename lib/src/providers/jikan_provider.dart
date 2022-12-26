import 'package:flutter/foundation.dart';
import 'package:tengoku/src/services/jikan_service.dart';

// TODO: See jikan_service.dart!

class JikanProvider extends ChangeNotifier {
  final JikanService _service = JikanService();

  bool isInitialized = false;
  bool isLoading = false;

  /* Upcoming */
  List _upcomingAnime = [];
  List get upcomingAnime => _upcomingAnime;

  Future<void> getUpcomingAnime() async {
    _setLoading(true);
    final List upcomingAnime = await _service.getUpcomingAnime();

    _upcomingAnime = upcomingAnime;
    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    value == true && isInitialized == false ? isInitialized = true : null;
    notifyListeners();
  }
}
