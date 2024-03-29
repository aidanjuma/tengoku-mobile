import 'package:isar/isar.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/models/anime_episode.dart';

class IsarService {
  final Isar isar;

  IsarService({required this.isar});

  /* Save AnimeResult object to disk for linking to AnimeEpisode objects. */
  Future<void> saveAnimeResult(AnimeResult animeResult) async {
    await isar.writeTxn(() async => await isar.animeResults.put(animeResult));
  }

  /* When navigating to episode, use to check if parent AnimeResult is stored; return if so. */
  Future<AnimeResult?> returnAnimeResultIfStored(int isarId) async {
    return await isar.animeResults.get(isarId);
  }

  /* When navigating to episode, use to check if stored; return episode if so. */
  Future<AnimeEpisode?> returnEpisodeIfStored(String episodeId) async {
    return await isar.animeEpisodes
        .filter()
        .episodeIdEqualTo(episodeId)
        .findFirst();
  }

  /* When episode has been selected for viewing, add to database. */
  Future<AnimeEpisode> startWatchingEpisode(AnimeEpisode episode) async {
    episode.isWatching = true;
    await isar.writeTxn(() async => await isar.animeEpisodes.put(episode));
    return episode;
  }

  /* When navigated to player, add duration in seconds (once available). */
  Future<void> addEpisodeDuration(
      Id episodeIsarId, int durationInSeconds) async {
    final AnimeEpisode? episode = await isar.animeEpisodes.get(episodeIsarId);

    if (episode?.durationInSeconds == null) {
      episode!.durationInSeconds = durationInSeconds;
      await isar.writeTxn(
        () async => await isar.animeEpisodes.put(episode),
      );
    }
  }

  /* Update episode progress - value between 0 and 1; determines isWatching/hasWatched. */
  Future<void> updateEpisodeProgress(Id episodeIsarId, double progress) async {
    final AnimeEpisode? episode = await isar.animeEpisodes.get(episodeIsarId);
    switch (episode) {
      case null:
        return;
      default:
        if (progress >= 0.95) {
          episode!.isWatching = false;
          episode.hasWatched = true;
        }
        episode!.amountWatched = progress;
        await isar.writeTxn(
          () async => await isar.animeEpisodes.put(episode),
        );
    }
  }

  /* Remove any sort of status from all episodes; i.e. watched, watching... */
  Future<void> deleteAllEpisodes() async {
    await isar.writeTxn(() async {
      // All episodes have an ID; find all and delete all.
      await isar.animeEpisodes.filter().episodeIdIsNotEmpty().deleteAll();
    });
  }

  /* Finds and returns a list of all anime with the 'isWatching' flag equal to true. */
  Future<List<AnimeEpisode>> getListOfCurrentlyWatching() async {
    return await isar.animeEpisodes.filter().isWatchingEqualTo(true).findAll();
  }
}
