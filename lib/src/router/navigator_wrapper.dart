import 'package:flutter/material.dart';
import 'package:tengoku/src/router/routes.dart';
import 'package:tengoku/src/ui/views/root_view.dart';
import 'package:tengoku/src/ui/views/search_view.dart';
import 'package:tengoku/src/ui/views/player_view.dart';
import 'package:tengoku/src/ui/views/discover_view.dart';
import 'package:tengoku/src/ui/views/anime_info_view.dart';

class NavigatorWrapper {
  static String initialRoute = Routes.root;
  static Map<String, WidgetBuilder> get routes {
    return {
      Routes.root: (context) => const RootView(),
      Routes.discover: (context) => const DiscoverView(),
      Routes.search: (context) => const SearchView(),
      Routes.animeInfo: (context) => const AnimeInfoView(),
      Routes.player: (context) => const PlayerView(),
      Routes.mangaInfo: (context) => const Scaffold(), // TODO
      Routes.reader: (context) => const Scaffold(), // TODO
    };
  }

  static Future push(BuildContext context, String route,
      {Object? arguments, Function? callback}) {
    return Navigator.of(context).pushNamed(route, arguments: arguments).then(
          (value) => callback != null ? callback() : null,
        );
  }

  static replace(BuildContext context, String route,
      {Object? arguments, Function? callback}) {
    Navigator.of(context)
        .pushReplacementNamed(route, arguments: arguments)
        .then(
          (value) => callback != null ? callback() : null,
        );
  }

  static pushAndRemoveAll(BuildContext context, String route,
      {Object? arguments, Function? callback}) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(
          route,
          (_) => false,
          arguments: arguments,
        )
        .then(
          (value) => callback != null ? callback() : null,
        );
  }
}
