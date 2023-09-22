// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultAdapter extends TypeAdapter<Result> {
  @override
  final int typeId = 1;

  @override
  Result read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Result(
      wrapperType: fields[0] as String?,
      kind: fields[1] as String?,
      artistId: fields[2] as int?,
      collectionId: fields[3] as int?,
      trackId: fields[4] as int?,
      artistName: fields[5] as String?,
      collectionName: fields[6] as String?,
      trackName: fields[7] as String?,
      collectionCensoredName: fields[8] as String?,
      trackCensoredName: fields[9] as String?,
      collectionArtistName: fields[10] as String?,
      artistViewUrl: fields[11] as String?,
      collectionViewUrl: fields[12] as String?,
      trackViewUrl: fields[13] as String?,
      previewUrl: fields[14] as String?,
      artworkUrl30: fields[15] as String?,
      artworkUrl60: fields[16] as String?,
      artworkUrl100: fields[17] as String?,
      collectionPrice: fields[18] as double?,
      trackPrice: fields[19] as double?,
      releaseDate: fields[20] as String?,
      collectionExplicitness: fields[21] as String?,
      trackExplicitness: fields[22] as String?,
      discCount: fields[23] as int?,
      discNumber: fields[24] as int?,
      trackCount: fields[25] as int?,
      trackNumber: fields[26] as int?,
      trackTimeMillis: fields[27] as int?,
      country: fields[28] as String?,
      currency: fields[29] as String?,
      primaryGenreName: fields[30] as String?,
      isStreamable: fields[31] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Result obj) {
    writer
      ..writeByte(32)
      ..writeByte(0)
      ..write(obj.wrapperType)
      ..writeByte(1)
      ..write(obj.kind)
      ..writeByte(2)
      ..write(obj.artistId)
      ..writeByte(3)
      ..write(obj.collectionId)
      ..writeByte(4)
      ..write(obj.trackId)
      ..writeByte(5)
      ..write(obj.artistName)
      ..writeByte(6)
      ..write(obj.collectionName)
      ..writeByte(7)
      ..write(obj.trackName)
      ..writeByte(8)
      ..write(obj.collectionCensoredName)
      ..writeByte(9)
      ..write(obj.trackCensoredName)
      ..writeByte(10)
      ..write(obj.collectionArtistName)
      ..writeByte(11)
      ..write(obj.artistViewUrl)
      ..writeByte(12)
      ..write(obj.collectionViewUrl)
      ..writeByte(13)
      ..write(obj.trackViewUrl)
      ..writeByte(14)
      ..write(obj.previewUrl)
      ..writeByte(15)
      ..write(obj.artworkUrl30)
      ..writeByte(16)
      ..write(obj.artworkUrl60)
      ..writeByte(17)
      ..write(obj.artworkUrl100)
      ..writeByte(18)
      ..write(obj.collectionPrice)
      ..writeByte(19)
      ..write(obj.trackPrice)
      ..writeByte(20)
      ..write(obj.releaseDate)
      ..writeByte(21)
      ..write(obj.collectionExplicitness)
      ..writeByte(22)
      ..write(obj.trackExplicitness)
      ..writeByte(23)
      ..write(obj.discCount)
      ..writeByte(24)
      ..write(obj.discNumber)
      ..writeByte(25)
      ..write(obj.trackCount)
      ..writeByte(26)
      ..write(obj.trackNumber)
      ..writeByte(27)
      ..write(obj.trackTimeMillis)
      ..writeByte(28)
      ..write(obj.country)
      ..writeByte(29)
      ..write(obj.currency)
      ..writeByte(30)
      ..write(obj.primaryGenreName)
      ..writeByte(31)
      ..write(obj.isStreamable);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
