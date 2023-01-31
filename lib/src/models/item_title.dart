import 'package:isar/isar.dart';

part 'item_title.g.dart';

@embedded
class ItemTitle {
  String? romaji;
  String? english;
  String? native;
  String? userPreferred;

  ItemTitle({
    this.romaji,
    this.english,
    this.native,
    this.userPreferred,
  });
}
