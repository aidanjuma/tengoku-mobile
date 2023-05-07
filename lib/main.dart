import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tengoku/src/ui/theme/global.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/models/anime_episode.dart';
import 'package:tengoku/src/providers/isar_provider.dart';
import 'package:tengoku/src/router/navigator_wrapper.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';
import 'package:tengoku/src/mixins/force_portrait_mode_mixin.dart';

import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Open Isar instance at app start time.
  final Directory dir = await getApplicationDocumentsDirectory();
  final Isar isar = await Isar.open(
    [AnimeEpisodeSchema, AnimeResultSchema],
    directory: dir.path,
  );
  final app = Application(isar: isar);
  runApp(app);
}

class Application extends StatelessWidget with ForcePortraitModeMixin {
  final Isar isar;

  Application({super.key, required this.isar});

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ConsumetProvider>(
          create: (_) => ConsumetProvider(),
        ),
        ChangeNotifierProvider<IsarProvider>(
          create: (_) => IsarProvider(isar),
        ),
      ],
      child: MaterialApp(
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeMode.system,
        initialRoute: NavigatorWrapper.initialRoute,
        routes: NavigatorWrapper.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
