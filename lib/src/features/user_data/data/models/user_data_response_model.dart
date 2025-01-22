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
    required this.name,
    required this.token,
  });

  @JsonKey(name: 'name')
  @HiveField(0, defaultValue: '')
  String name;
  @JsonKey(name: 'token')
  @HiveField(1, defaultValue: '')
  String token;
}
