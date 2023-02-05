// Holds trailer data (videos hosted on YouTube).
import 'jikan_image.dart';

class Trailer {
  final String youtubeId;
  final String youtubeUrl;
  String? youtubeEmbedUrl;
  JikanImage? images;

  Trailer({
    required this.youtubeId,
    required this.youtubeUrl,
    this.youtubeEmbedUrl,
    this.images,
  });
}
