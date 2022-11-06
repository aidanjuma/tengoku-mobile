class AnimeEpisode {
  final String id;
  final int number;
  final String? title;
  final String? description;
  final bool? isFiller;
  final String? url;
  final String? image;
  final String? releaseDate;

  // Custom property: Store as value between 0 & 1; default is 0.
  double amountWatched;

  AnimeEpisode({
    required this.id,
    required this.number,
    this.title,
    this.description,
    this.isFiller,
    this.url,
    this.image,
    this.releaseDate,
    this.amountWatched = 0,
  });
}
