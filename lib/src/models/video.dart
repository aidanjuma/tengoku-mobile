class Video {
  String url;
  String? quality;
  bool? isM3U8;
  bool? isDASH;
  int? sizeInBytes;

  Video({
    required this.url,
    this.quality,
    this.isM3U8,
    this.isDASH,
    this.sizeInBytes,
  });
}
