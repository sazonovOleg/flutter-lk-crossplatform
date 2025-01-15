// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoppingCartAdapter extends TypeAdapter<ShoppingCart> {
  @override
  final int typeId = 5;

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
  final int typeId = 6;

  @override
  ShoppingCartItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoppingCartItem(
      name: fields[1] == null ? '' : fields[1] as String,
      price: fields[2] == null ? 0 : fields[2] as double,
      kod: fields[3] == null ? '' : fields[3] as String,
      sum: fields[4] == null ? 0 : fields[4] as num,
      image: fields[5] == null ? '' : fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ShoppingCartItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.kod)
      ..writeByte(4)
      ..write(obj.sum)
      ..writeByte(5)
      ..write(obj.image);
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
