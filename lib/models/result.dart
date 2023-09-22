import 'dart:convert';

import 'package:hive/hive.dart';

part 'result.g.dart';

@HiveType(typeId: 1)
class Result extends HiveObject {
  @HiveField(0)
  String? wrapperType;

  @HiveField(1)
  String? kind;

  @HiveField(2)
  int? artistId;

  @HiveField(3)
  int? collectionId;

  @HiveField(4)
  int? trackId;

  @HiveField(5)
  String? artistName;

  @HiveField(6)
  String? collectionName;

  @HiveField(7)
  String? trackName;

  @HiveField(8)
  String? collectionCensoredName;

  @HiveField(9)
  String? trackCensoredName;

  @HiveField(10)
  String? collectionArtistName;

  @HiveField(11)
  String? artistViewUrl;

  @HiveField(12)
  String? collectionViewUrl;

  @HiveField(13)
  String? trackViewUrl;

  @HiveField(14)
  String? previewUrl;

  @HiveField(15)
  String? artworkUrl30;

  @HiveField(16)
  String? artworkUrl60;

  @HiveField(17)
  String? artworkUrl100;

  @HiveField(18)
  double? collectionPrice;

  @HiveField(19)
  double? trackPrice;

  @HiveField(20)
  String? releaseDate;

  @HiveField(21)
  String? collectionExplicitness;

  @HiveField(22)
  String? trackExplicitness;

  @HiveField(23)
  int? discCount;

  @HiveField(24)
  int? discNumber;

  @HiveField(25)
  int? trackCount;

  @HiveField(26)
  int? trackNumber;

  @HiveField(27)
  int? trackTimeMillis;

  @HiveField(28)
  String? country;

  @HiveField(29)
  String? currency;

  @HiveField(30)
  String? primaryGenreName;

  @HiveField(31)
  bool? isStreamable;

  Result({
    this.wrapperType,
    this.kind,
    this.artistId,
    this.collectionId,
    this.trackId,
    this.artistName,
    this.collectionName,
    this.trackName,
    this.collectionCensoredName,
    this.trackCensoredName,
    this.collectionArtistName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.trackViewUrl,
    this.previewUrl,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.trackPrice,
    this.releaseDate,
    this.collectionExplicitness,
    this.trackExplicitness,
    this.discCount,
    this.discNumber,
    this.trackCount,
    this.trackNumber,
    this.trackTimeMillis,
    this.country,
    this.currency,
    this.primaryGenreName,
    this.isStreamable,
  });

  Result copyWith({
    String? wrapperType,
    String? kind,
    int? artistId,
    int? collectionId,
    int? trackId,
    String? artistName,
    String? collectionName,
    String? trackName,
    String? collectionCensoredName,
    String? trackCensoredName,
    String? collectionArtistName,
    String? artistViewUrl,
    String? collectionViewUrl,
    String? trackViewUrl,
    String? previewUrl,
    String? artworkUrl30,
    String? artworkUrl60,
    String? artworkUrl100,
    double? collectionPrice,
    double? trackPrice,
    String? releaseDate,
    String? collectionExplicitness,
    String? trackExplicitness,
    int? discCount,
    int? discNumber,
    int? trackCount,
    int? trackNumber,
    int? trackTimeMillis,
    String? country,
    String? currency,
    String? primaryGenreName,
    bool? isStreamable,
  }) {
    return Result(
      wrapperType: wrapperType ?? this.wrapperType,
      kind: kind ?? this.kind,
      artistId: artistId ?? this.artistId,
      collectionId: collectionId ?? this.collectionId,
      trackId: trackId ?? this.trackId,
      artistName: artistName ?? this.artistName,
      collectionName: collectionName ?? this.collectionName,
      trackName: trackName ?? this.trackName,
      collectionCensoredName:
          collectionCensoredName ?? this.collectionCensoredName,
      trackCensoredName: trackCensoredName ?? this.trackCensoredName,
      collectionArtistName: collectionArtistName ?? this.collectionArtistName,
      artistViewUrl: artistViewUrl ?? this.artistViewUrl,
      collectionViewUrl: collectionViewUrl ?? this.collectionViewUrl,
      trackViewUrl: trackViewUrl ?? this.trackViewUrl,
      previewUrl: previewUrl ?? this.previewUrl,
      artworkUrl30: artworkUrl30 ?? this.artworkUrl30,
      artworkUrl60: artworkUrl60 ?? this.artworkUrl60,
      artworkUrl100: artworkUrl100 ?? this.artworkUrl100,
      collectionPrice: collectionPrice ?? this.collectionPrice,
      trackPrice: trackPrice ?? this.trackPrice,
      releaseDate: releaseDate ?? this.releaseDate,
      collectionExplicitness:
          collectionExplicitness ?? this.collectionExplicitness,
      trackExplicitness: trackExplicitness ?? this.trackExplicitness,
      discCount: discCount ?? this.discCount,
      discNumber: discNumber ?? this.discNumber,
      trackCount: trackCount ?? this.trackCount,
      trackNumber: trackNumber ?? this.trackNumber,
      trackTimeMillis: trackTimeMillis ?? this.trackTimeMillis,
      country: country ?? this.country,
      currency: currency ?? this.currency,
      primaryGenreName: primaryGenreName ?? this.primaryGenreName,
      isStreamable: isStreamable ?? this.isStreamable,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'wrapperType': wrapperType,
      'kind': kind,
      'artistId': artistId,
      'collectionId': collectionId,
      'trackId': trackId,
      'artistName': artistName,
      'collectionName': collectionName,
      'trackName': trackName,
      'collectionCensoredName': collectionCensoredName,
      'trackCensoredName': trackCensoredName,
      'collectionArtistName': collectionArtistName,
      'artistViewUrl': artistViewUrl,
      'collectionViewUrl': collectionViewUrl,
      'trackViewUrl': trackViewUrl,
      'previewUrl': previewUrl,
      'artworkUrl30': artworkUrl30,
      'artworkUrl60': artworkUrl60,
      'artworkUrl100': artworkUrl100,
      'collectionPrice': collectionPrice,
      'trackPrice': trackPrice,
      'releaseDate': releaseDate,
      'collectionExplicitness': collectionExplicitness,
      'trackExplicitness': trackExplicitness,
      'discCount': discCount,
      'discNumber': discNumber,
      'trackCount': trackCount,
      'trackNumber': trackNumber,
      'trackTimeMillis': trackTimeMillis,
      'country': country,
      'currency': currency,
      'primaryGenreName': primaryGenreName,
      'isStreamable': isStreamable,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      wrapperType:
          map['wrapperType'] != null ? map['wrapperType'] as String : null,
      kind: map['kind'] != null ? map['kind'] as String : null,
      artistId: map['artistId'] != null ? map['artistId'] as int : null,
      collectionId:
          map['collectionId'] != null ? map['collectionId'] as int : null,
      trackId: map['trackId'] != null ? map['trackId'] as int : null,
      artistName:
          map['artistName'] != null ? map['artistName'] as String : null,
      collectionName: map['collectionName'] != null
          ? map['collectionName'] as String
          : null,
      trackName: map['trackName'] != null ? map['trackName'] as String : null,
      collectionCensoredName: map['collectionCensoredName'] != null
          ? map['collectionCensoredName'] as String
          : null,
      trackCensoredName: map['trackCensoredName'] != null
          ? map['trackCensoredName'] as String
          : null,
      collectionArtistName: map['collectionArtistName'] != null
          ? map['collectionArtistName'] as String
          : null,
      artistViewUrl:
          map['artistViewUrl'] != null ? map['artistViewUrl'] as String : null,
      collectionViewUrl: map['collectionViewUrl'] != null
          ? map['collectionViewUrl'] as String
          : null,
      trackViewUrl:
          map['trackViewUrl'] != null ? map['trackViewUrl'] as String : null,
      previewUrl:
          map['previewUrl'] != null ? map['previewUrl'] as String : null,
      artworkUrl30:
          map['artworkUrl30'] != null ? map['artworkUrl30'] as String : null,
      artworkUrl60:
          map['artworkUrl60'] != null ? map['artworkUrl60'] as String : null,
      artworkUrl100:
          map['artworkUrl100'] != null ? map['artworkUrl100'] as String : null,
      collectionPrice: map['collectionPrice'] != null
          ? map['collectionPrice'] as double
          : null,
      trackPrice:
          map['trackPrice'] != null ? map['trackPrice'] as double : null,
      releaseDate:
          map['releaseDate'] != null ? map['releaseDate'] as String : null,
      collectionExplicitness: map['collectionExplicitness'] != null
          ? map['collectionExplicitness'] as String
          : null,
      trackExplicitness: map['trackExplicitness'] != null
          ? map['trackExplicitness'] as String
          : null,
      discCount: map['discCount'] != null ? map['discCount'] as int : null,
      discNumber: map['discNumber'] != null ? map['discNumber'] as int : null,
      trackCount: map['trackCount'] != null ? map['trackCount'] as int : null,
      trackNumber:
          map['trackNumber'] != null ? map['trackNumber'] as int : null,
      trackTimeMillis:
          map['trackTimeMillis'] != null ? map['trackTimeMillis'] as int : null,
      country: map['country'] != null ? map['country'] as String : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      primaryGenreName: map['primaryGenreName'] != null
          ? map['primaryGenreName'] as String
          : null,
      isStreamable:
          map['isStreamable'] != null ? map['isStreamable'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) =>
      Result.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Result(wrapperType: $wrapperType, kind: $kind, artistId: $artistId, collectionId: $collectionId, trackId: $trackId, artistName: $artistName, collectionName: $collectionName, trackName: $trackName, collectionCensoredName: $collectionCensoredName, trackCensoredName: $trackCensoredName, collectionArtistName: $collectionArtistName, artistViewUrl: $artistViewUrl, collectionViewUrl: $collectionViewUrl, trackViewUrl: $trackViewUrl, previewUrl: $previewUrl, artworkUrl30: $artworkUrl30, artworkUrl60: $artworkUrl60, artworkUrl100: $artworkUrl100, collectionPrice: $collectionPrice, trackPrice: $trackPrice, releaseDate: $releaseDate, collectionExplicitness: $collectionExplicitness, trackExplicitness: $trackExplicitness, discCount: $discCount, discNumber: $discNumber, trackCount: $trackCount, trackNumber: $trackNumber, trackTimeMillis: $trackTimeMillis, country: $country, currency: $currency, primaryGenreName: $primaryGenreName, isStreamable: $isStreamable)';
  }

  @override
  bool operator ==(covariant Result other) {
    if (identical(this, other)) return true;

    return other.wrapperType == wrapperType &&
        other.kind == kind &&
        other.artistId == artistId &&
        other.collectionId == collectionId &&
        other.trackId == trackId &&
        other.artistName == artistName &&
        other.collectionName == collectionName &&
        other.trackName == trackName &&
        other.collectionCensoredName == collectionCensoredName &&
        other.trackCensoredName == trackCensoredName &&
        other.collectionArtistName == collectionArtistName &&
        other.artistViewUrl == artistViewUrl &&
        other.collectionViewUrl == collectionViewUrl &&
        other.trackViewUrl == trackViewUrl &&
        other.previewUrl == previewUrl &&
        other.artworkUrl30 == artworkUrl30 &&
        other.artworkUrl60 == artworkUrl60 &&
        other.artworkUrl100 == artworkUrl100 &&
        other.collectionPrice == collectionPrice &&
        other.trackPrice == trackPrice &&
        other.releaseDate == releaseDate &&
        other.collectionExplicitness == collectionExplicitness &&
        other.trackExplicitness == trackExplicitness &&
        other.discCount == discCount &&
        other.discNumber == discNumber &&
        other.trackCount == trackCount &&
        other.trackNumber == trackNumber &&
        other.trackTimeMillis == trackTimeMillis &&
        other.country == country &&
        other.currency == currency &&
        other.primaryGenreName == primaryGenreName &&
        other.isStreamable == isStreamable;
  }

  @override
  int get hashCode {
    return wrapperType.hashCode ^
        kind.hashCode ^
        artistId.hashCode ^
        collectionId.hashCode ^
        trackId.hashCode ^
        artistName.hashCode ^
        collectionName.hashCode ^
        trackName.hashCode ^
        collectionCensoredName.hashCode ^
        trackCensoredName.hashCode ^
        collectionArtistName.hashCode ^
        artistViewUrl.hashCode ^
        collectionViewUrl.hashCode ^
        trackViewUrl.hashCode ^
        previewUrl.hashCode ^
        artworkUrl30.hashCode ^
        artworkUrl60.hashCode ^
        artworkUrl100.hashCode ^
        collectionPrice.hashCode ^
        trackPrice.hashCode ^
        releaseDate.hashCode ^
        collectionExplicitness.hashCode ^
        trackExplicitness.hashCode ^
        discCount.hashCode ^
        discNumber.hashCode ^
        trackCount.hashCode ^
        trackNumber.hashCode ^
        trackTimeMillis.hashCode ^
        country.hashCode ^
        currency.hashCode ^
        primaryGenreName.hashCode ^
        isStreamable.hashCode;
  }
}
