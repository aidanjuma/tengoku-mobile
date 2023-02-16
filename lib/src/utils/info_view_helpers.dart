import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';
import 'package:tengoku/src/enums/genres.dart';
import 'package:tengoku/src/models/anime_episode.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/ui/components/panels/pills/genres_pill.dart';
import 'package:tengoku/src/ui/components/panels/tiles/episode_tile.dart';
import 'package:tengoku/src/ui/components/panels/cards/relation_card.dart';

Widget renderBackgroundImage(double height) {
  return Consumer<ConsumetProvider>(
    builder: (context, consumetProvider, child) {
      String? image = consumetProvider.selectedAnime!.bannerImage;
      // Should theoretically always have cover image; fallback if no bannerImage.
      image ??= consumetProvider.selectedAnime!.coverImage;
      return Container(
        width: double.infinity,
        height: height * 0.355,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image!),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
      );
    },
  );
}

List<GenresPill> mapGenresPills(List<Genres> genres) {
  List<GenresPill> pills = [];

  /* Map n genre(s) to n GenresPill(s) */
  for (int i = 0; i < genres.length; i++) {
    final genre = genres[i];
    pills.add(
      GenresPill(
        genre: genre,
        spacing: i < genres.length
            ? const EdgeInsets.only(right: 8)
            : const EdgeInsets.only(left: 8),
      ),
    );
  }

  return pills;
}

List<EpisodeTile> mapEpisodeTiles(List<AnimeEpisode> episodes) {
  List<EpisodeTile> tiles = [];

  /* Map n episode(s) to n EpisodeTile(s) */
  for (int i = 0; i < episodes.length; i++) {
    final episode = episodes[i];
    tiles.add(EpisodeTile(episode: episode));
  }

  return tiles;
}

List<RelationCard> mapRelationsCards(List<AnimeResult> relations) {
  List<RelationCard> cards = [];

  /* Map n relation(s) to n RelationCard(s) */
  for (int i = 0; i < relations.length; i++) {
    final relation = relations[i];
    cards.add(
      RelationCard(
        relation: relation,
        spacing: i < relations.length
            ? const EdgeInsets.only(right: 12)
            : const EdgeInsets.only(left: 12),
      ),
    );
  }

  return cards;
}
