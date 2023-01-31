// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_episode.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAnimeEpisodeCollection on Isar {
  IsarCollection<AnimeEpisode> get animeEpisodes => this.collection();
}

const AnimeEpisodeSchema = CollectionSchema(
  name: r'AnimeEpisode',
  id: -1683706030441155514,
  properties: {
    r'amountWatched': PropertySchema(
      id: 0,
      name: r'amountWatched',
      type: IsarType.double,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'durationInSeconds': PropertySchema(
      id: 2,
      name: r'durationInSeconds',
      type: IsarType.long,
    ),
    r'episodeId': PropertySchema(
      id: 3,
      name: r'episodeId',
      type: IsarType.string,
    ),
    r'hasWatched': PropertySchema(
      id: 4,
      name: r'hasWatched',
      type: IsarType.bool,
    ),
    r'image': PropertySchema(
      id: 5,
      name: r'image',
      type: IsarType.string,
    ),
    r'isFiller': PropertySchema(
      id: 6,
      name: r'isFiller',
      type: IsarType.bool,
    ),
    r'isWatching': PropertySchema(
      id: 7,
      name: r'isWatching',
      type: IsarType.bool,
    ),
    r'number': PropertySchema(
      id: 8,
      name: r'number',
      type: IsarType.long,
    ),
    r'parentIsarId': PropertySchema(
      id: 9,
      name: r'parentIsarId',
      type: IsarType.long,
    ),
    r'releaseDate': PropertySchema(
      id: 10,
      name: r'releaseDate',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 11,
      name: r'title',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 12,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _animeEpisodeEstimateSize,
  serialize: _animeEpisodeSerialize,
  deserialize: _animeEpisodeDeserialize,
  deserializeProp: _animeEpisodeDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _animeEpisodeGetId,
  getLinks: _animeEpisodeGetLinks,
  attach: _animeEpisodeAttach,
  version: '3.0.5',
);

int _animeEpisodeEstimateSize(
  AnimeEpisode object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.episodeId.length * 3;
  {
    final value = object.image;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.releaseDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _animeEpisodeSerialize(
  AnimeEpisode object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amountWatched);
  writer.writeString(offsets[1], object.description);
  writer.writeLong(offsets[2], object.durationInSeconds);
  writer.writeString(offsets[3], object.episodeId);
  writer.writeBool(offsets[4], object.hasWatched);
  writer.writeString(offsets[5], object.image);
  writer.writeBool(offsets[6], object.isFiller);
  writer.writeBool(offsets[7], object.isWatching);
  writer.writeLong(offsets[8], object.number);
  writer.writeLong(offsets[9], object.parentIsarId);
  writer.writeString(offsets[10], object.releaseDate);
  writer.writeString(offsets[11], object.title);
  writer.writeString(offsets[12], object.url);
}

AnimeEpisode _animeEpisodeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnimeEpisode(
    amountWatched: reader.readDoubleOrNull(offsets[0]) ?? 0,
    description: reader.readStringOrNull(offsets[1]),
    durationInSeconds: reader.readLongOrNull(offsets[2]),
    episodeId: reader.readString(offsets[3]),
    hasWatched: reader.readBoolOrNull(offsets[4]) ?? false,
    image: reader.readStringOrNull(offsets[5]),
    isFiller: reader.readBoolOrNull(offsets[6]),
    isWatching: reader.readBoolOrNull(offsets[7]) ?? false,
    number: reader.readLong(offsets[8]),
    parentIsarId: reader.readLongOrNull(offsets[9]),
    releaseDate: reader.readStringOrNull(offsets[10]),
    title: reader.readStringOrNull(offsets[11]),
    url: reader.readStringOrNull(offsets[12]),
  );
  object.isarId = id;
  return object;
}

P _animeEpisodeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _animeEpisodeGetId(AnimeEpisode object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _animeEpisodeGetLinks(AnimeEpisode object) {
  return [];
}

void _animeEpisodeAttach(
    IsarCollection<dynamic> col, Id id, AnimeEpisode object) {
  object.isarId = id;
}

extension AnimeEpisodeQueryWhereSort
    on QueryBuilder<AnimeEpisode, AnimeEpisode, QWhere> {
  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnimeEpisodeQueryWhere
    on QueryBuilder<AnimeEpisode, AnimeEpisode, QWhereClause> {
  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AnimeEpisodeQueryFilter
    on QueryBuilder<AnimeEpisode, AnimeEpisode, QFilterCondition> {
  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      amountWatchedEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amountWatched',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      amountWatchedGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amountWatched',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      amountWatchedLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amountWatched',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      amountWatchedBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amountWatched',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      durationInSecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'durationInSeconds',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      durationInSecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'durationInSeconds',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      durationInSecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      durationInSecondsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      durationInSecondsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      durationInSecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationInSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      episodeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'episodeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      episodeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'episodeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      episodeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'episodeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      episodeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'episodeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      episodeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'episodeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      episodeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'episodeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      episodeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'episodeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      episodeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'episodeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      episodeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'episodeId',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      episodeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'episodeId',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      hasWatchedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasWatched',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> imageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      imageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> imageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> imageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> imageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> imageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      isFillerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isFiller',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      isFillerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isFiller',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      isFillerEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFiller',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      isWatchingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWatching',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> numberEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      numberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      numberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> numberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      parentIsarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentIsarId',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      parentIsarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentIsarId',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      parentIsarIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentIsarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      parentIsarIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentIsarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      parentIsarIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentIsarId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      parentIsarIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentIsarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      releaseDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'releaseDate',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      releaseDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'releaseDate',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      releaseDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      releaseDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      releaseDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      releaseDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'releaseDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      releaseDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      releaseDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      releaseDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      releaseDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'releaseDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      releaseDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'releaseDate',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      releaseDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'releaseDate',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension AnimeEpisodeQueryObject
    on QueryBuilder<AnimeEpisode, AnimeEpisode, QFilterCondition> {}

extension AnimeEpisodeQueryLinks
    on QueryBuilder<AnimeEpisode, AnimeEpisode, QFilterCondition> {}

extension AnimeEpisodeQuerySortBy
    on QueryBuilder<AnimeEpisode, AnimeEpisode, QSortBy> {
  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByAmountWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountWatched', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      sortByAmountWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountWatched', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      sortByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      sortByDurationInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByEpisodeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeId', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByEpisodeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeId', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByHasWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasWatched', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      sortByHasWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasWatched', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByIsFiller() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFiller', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByIsFillerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFiller', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByIsWatching() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatching', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      sortByIsWatchingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatching', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByParentIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIsarId', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      sortByParentIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIsarId', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByReleaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      sortByReleaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension AnimeEpisodeQuerySortThenBy
    on QueryBuilder<AnimeEpisode, AnimeEpisode, QSortThenBy> {
  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByAmountWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountWatched', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      thenByAmountWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountWatched', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      thenByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      thenByDurationInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByEpisodeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeId', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByEpisodeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeId', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByHasWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasWatched', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      thenByHasWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasWatched', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByIsFiller() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFiller', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByIsFillerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFiller', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByIsWatching() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatching', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      thenByIsWatchingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatching', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByParentIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIsarId', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      thenByParentIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIsarId', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByReleaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy>
      thenByReleaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension AnimeEpisodeQueryWhereDistinct
    on QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct> {
  QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct>
      distinctByAmountWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amountWatched');
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct>
      distinctByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationInSeconds');
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct> distinctByEpisodeId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'episodeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct> distinctByHasWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasWatched');
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct> distinctByIsFiller() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFiller');
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct> distinctByIsWatching() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWatching');
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct> distinctByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'number');
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct> distinctByParentIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentIsarId');
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct> distinctByReleaseDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'releaseDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnimeEpisode, AnimeEpisode, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension AnimeEpisodeQueryProperty
    on QueryBuilder<AnimeEpisode, AnimeEpisode, QQueryProperty> {
  QueryBuilder<AnimeEpisode, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<AnimeEpisode, double, QQueryOperations> amountWatchedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amountWatched');
    });
  }

  QueryBuilder<AnimeEpisode, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<AnimeEpisode, int?, QQueryOperations>
      durationInSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationInSeconds');
    });
  }

  QueryBuilder<AnimeEpisode, String, QQueryOperations> episodeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'episodeId');
    });
  }

  QueryBuilder<AnimeEpisode, bool, QQueryOperations> hasWatchedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasWatched');
    });
  }

  QueryBuilder<AnimeEpisode, String?, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<AnimeEpisode, bool?, QQueryOperations> isFillerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFiller');
    });
  }

  QueryBuilder<AnimeEpisode, bool, QQueryOperations> isWatchingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWatching');
    });
  }

  QueryBuilder<AnimeEpisode, int, QQueryOperations> numberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'number');
    });
  }

  QueryBuilder<AnimeEpisode, int?, QQueryOperations> parentIsarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentIsarId');
    });
  }

  QueryBuilder<AnimeEpisode, String?, QQueryOperations> releaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'releaseDate');
    });
  }

  QueryBuilder<AnimeEpisode, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<AnimeEpisode, String?, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
