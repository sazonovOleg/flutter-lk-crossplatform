// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoppingCartAdapter extends TypeAdapter<ShoppingCart> {
  @override
  final int typeId = 2;

  @override
  ShoppingCart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoppingCart(
      items:
          fields[0] == null ? [] : (fields[0] as List).cast<ShoppingCartItem>(),
      quantity: fields[1] == null ? 0 : fields[1] as int,
      sum: fields[2] == null ? 0 : fields[2] as num,
    );
  }

  @override
  void write(BinaryWriter writer, ShoppingCart obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.items)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.sum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoppingCartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShoppingCartItemAdapter extends TypeAdapter<ShoppingCartItem> {
  @override
  final int typeId = 3;

  @override
  ShoppingCartItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoppingCartItem(
      price: fields[1] == null ? 0 : fields[1] as double,
      name: fields[2] == null ? '' : fields[2] as String,
      art: fields[3] == null ? '' : fields[3] as String,
      kod: fields[4] == null ? '' : fields[4] as String,
      quantity: fields[5] == null ? 0 : fields[5] as int,
      selected: fields[6] == null ? false : fields[6] as bool,
      sum: fields[7] == null ? 0 : fields[7] as num,
      groupId: fields[9] == null ? '' : fields[9] as String,
      groupName: fields[10] == null ? '' : fields[10] as String,
      image: fields[11] == null ? '' : fields[11] as String,
      ownerName: fields[12] == null ? '' : fields[12] as String,
      ownerId: fields[13] == null ? '' : fields[13] as String,
      warehouseId: fields[14] == null ? '' : fields[14] as String,
    )..formattedPrice = fields[8] == null ? '' : fields[8] as String;
  }

  @override
  void write(BinaryWriter writer, ShoppingCartItem obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.art)
      ..writeByte(4)
      ..write(obj.kod)
      ..writeByte(5)
      ..write(obj.quantity)
      ..writeByte(6)
      ..write(obj.selected)
      ..writeByte(7)
      ..write(obj.sum)
      ..writeByte(8)
      ..write(obj.formattedPrice)
      ..writeByte(9)
      ..write(obj.groupId)
      ..writeByte(10)
      ..write(obj.groupName)
      ..writeByte(11)
      ..write(obj.image)
      ..writeByte(12)
      ..write(obj.ownerName)
      ..writeByte(13)
      ..write(obj.ownerId)
      ..writeByte(14)
      ..write(obj.warehouseId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoppingCartItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
