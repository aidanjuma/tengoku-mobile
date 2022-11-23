class AnimeEpisode {
  final String id;
  final int number;
  String? title;
  String? description;
  bool? isFiller;
  String? url;
  String? image;
  String? releaseDate;

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
