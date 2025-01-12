// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataResponseAdapter extends TypeAdapter<UserDataResponse> {
  @override
  final int typeId = 1;

  @override
  UserDataResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDataResponse(
      surname: fields[0] == null ? '' : fields[0] as String,
      name: fields[1] == null ? '' : fields[1] as String,
      lastName: fields[2] == null ? '' : fields[2] as String,
      email: fields[4] == null ? '' : fields[4] as String,
      phone: fields[3] == null ? '' : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserDataResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.surname)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      surname: json['Фамилия'] as String,
      name: json['Имя'] as String,
      lastName: json['Отчество'] as String,
      email: json['Email'] as String,
      phone: json['НомерТелефона'] as String,
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'Фамилия': instance.surname,
      'Имя': instance.name,
      'Отчество': instance.lastName,
      'НомерТелефона': instance.phone,
      'Email': instance.email,
    };
