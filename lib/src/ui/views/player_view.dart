import 'package:flutter/material.dart';
import 'package:tengoku/src/mixins/orientation_mixins.dart';

// TODO: Video Player with Chewie for anime.

class PlayerView extends StatefulWidget {
  const PlayerView({super.key});

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView>
    with ForceLandscapeStatefulModeMixin<PlayerView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(),
      ),
    );
  }
}
