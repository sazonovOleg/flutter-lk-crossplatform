// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesAdapter extends TypeAdapter<Favorites> {
  @override
  final int typeId = 4;

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
  final int typeId = 5;

  @override
  FavoritesItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritesItem(
      price: fields[0] == null ? 0 : fields[0] as num,
      name: fields[1] == null ? '' : fields[1] as String,
      art: fields[2] == null ? '' : fields[2] as String,
      kod: fields[3] == null ? '' : fields[3] as String,
      image: fields[5] == null ? '' : fields[5] as String,
      groupName: fields[6] == null ? '' : fields[6] as String,
      groupId: fields[7] == null ? '' : fields[7] as String,
      ownerId: fields[8] == null ? '' : fields[8] as String,
      warehouseId: fields[9] == null ? '' : fields[9] as String,
    )..formattedPrice = fields[4] == null ? '' : fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, FavoritesItem obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.art)
      ..writeByte(3)
      ..write(obj.kod)
      ..writeByte(4)
      ..write(obj.formattedPrice)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.groupName)
      ..writeByte(7)
      ..write(obj.groupId)
      ..writeByte(8)
      ..write(obj.ownerId)
      ..writeByte(9)
      ..write(obj.warehouseId);
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
