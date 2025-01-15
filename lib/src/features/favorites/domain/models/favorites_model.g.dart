// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesAdapter extends TypeAdapter<Favorites> {
  @override
  final int typeId = 3;

  @override
  Favorites read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favorites(
      items: (fields[0] as List).cast<FavoritesItem>(),
      quantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Favorites obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.items)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FavoritesItemAdapter extends TypeAdapter<FavoritesItem> {
  @override
  final int typeId = 4;

  @override
  FavoritesItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritesItem(
      price: fields[0] == null ? 0 : fields[0] as num,
      name: fields[1] == null ? '' : fields[1] as String,
      kod: fields[2] == null ? '' : fields[2] as String,
      image: fields[3] == null ? '' : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoritesItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.kod)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
