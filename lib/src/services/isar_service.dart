import 'package:isar/isar.dart';
import 'package:tengoku/src/models/anime_episode.dart';

class IsarService {
  final Isar isar;

  IsarService({required this.isar});

  /* When navigating to episode, use to check if stored; return episode if so. */
  Future<AnimeEpisode?> returnEpisodeIfStored(String episodeId) async {
    return await isar.animeEpisodes.filter().idEqualTo(episodeId).findFirst();
  }

  /* When episode has been selected for viewing, add to database. */
  Future<void> startWatchingEpisode(AnimeEpisode episode) async {
    episode.isWatching = true;
    await isar.writeTxn(() async => await isar.animeEpisodes.put(episode));
  }

  /* When navigated to player, add duration in seconds (once available). */
  Future<void> addEpisodeDuration(
      Id episodeIsarId, int durationInSeconds) async {
    final AnimeEpisode? episode = await isar.animeEpisodes.get(episodeIsarId);
    switch (episode?.durationInSeconds) {
      case null:
        return;
      default:
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
      await isar.animeEpisodes.filter().idIsNotEmpty().deleteAll();
    });
  }

  /* Finds and returns a list of all anime with the 'isWatching' flag equal to true. */
  Future<List<AnimeEpisode>> getListOfCurrentlyWatching() async {
    return await isar.animeEpisodes.filter().isWatchingEqualTo(true).findAll();
  }
}
