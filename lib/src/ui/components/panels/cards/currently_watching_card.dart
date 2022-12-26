import 'package:flutter/material.dart';
import 'package:tengoku/src/models/anime_episode.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

// TODO: copied from ContentCard, changed properties; next, change to wider card UI.
class CurrentlyWatchingCard extends StatelessWidget {
  final AnimeEpisode episode;
  final EdgeInsets spacing;

  const CurrentlyWatchingCard({
    super.key,
    required this.episode,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      scaleFactor: 0.5,
      duration: const Duration(milliseconds: 50),
      onPressed: () => {},
      child: Container(
        width: 100,
        height: 142,
        margin: spacing,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(episode.image!),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.25),
              BlendMode.darken,
            ),
          ),
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 8,
          ),
          child: Text(
            episode.title ?? 'Episode ${episode.number}',
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}
