import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:tengoku/src/models/anime_episode.dart';
import 'package:tengoku/src/ui/theme/global.dart';
import 'package:tengoku/src/ui/views/root_view.dart';
import 'package:tengoku/src/providers/isar_provider.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';
import 'package:tengoku/src/mixins/force_portrait_mode_mixin.dart';

void main() async {
  // Open Isar instance at app start time.
  final Isar isar = await Isar.open([AnimeEpisodeSchema]);
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
        ChangeNotifierProvider<IsarProvider>(
          create: (_) => IsarProvider(isar),
        ),
        ChangeNotifierProvider<ConsumetProvider>(
          create: (_) => ConsumetProvider(),
        ),
      ],
      child: MaterialApp(
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeMode.system,
        home: const RootView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
