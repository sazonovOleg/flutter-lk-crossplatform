import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data_response_model.g.dart';

List<UserDataResponse> userDataFromJson(List<dynamic> data) =>
    List<UserDataResponse>.from(
      data.map(
        (x) => _$UserDataResponseFromJson(x as Map<String, dynamic>),
      ),
    );

@HiveType(typeId: 1)
@JsonSerializable()
class UserDataResponse {
  UserDataResponse({
    required this.surname,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  @JsonKey(name: 'Фамилия')
  @HiveField(0, defaultValue: '')
  String surname;
  @JsonKey(name: 'Имя')
  @HiveField(1, defaultValue: '')
  String name;
  @JsonKey(name: 'Отчество')
  @HiveField(2, defaultValue: '')
  String lastName;
  @JsonKey(name: 'НомерТелефона')
  @HiveField(3, defaultValue: '')
  String phone;
  @JsonKey(name: 'Email')
  @HiveField(4, defaultValue: '')
  String email;
}
