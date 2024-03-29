import 'package:isar/isar.dart';

part 'anime_episode.g.dart';

@collection
class AnimeEpisode {
  Id isarId = Isar.autoIncrement;
  final String episodeId;
  final int number;
  int? parentIsarId;
  String? title;
  String? description;
  bool? isFiller;
  String? url;
  String? image;
  String? releaseDate;

  // Shows whether episode has been watched or not.
  bool isWatching;
  // Between 0 & 1: represents percentage of episode watched.
  double amountWatched;
  // Duration; main use found in continue watching card.
  int? durationInSeconds;
  // NOTE: If isWatching == false && amountWatched >= 0.95, hasWatched == true.
  bool hasWatched;

  AnimeEpisode({
    required this.episodeId,
    required this.number,
    this.parentIsarId,
    this.title,
    this.description,
    this.isFiller,
    this.url,
    this.image,
    this.releaseDate,
    this.isWatching = false,
    this.amountWatched = 0,
    this.durationInSeconds,
    this.hasWatched = false,
  });
}
