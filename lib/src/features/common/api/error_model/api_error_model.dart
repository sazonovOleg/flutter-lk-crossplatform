import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

List<ApiErrorResponse> apiErrorFromJson(List<dynamic> data) =>
    List<ApiErrorResponse>.from(
      data.map(
        (x) => _$ApiErrorResponseFromJson(x as Map<String, dynamic>),
      ),
    );

@JsonSerializable()
class ApiErrorResponse {
  ApiErrorResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  @JsonKey(name: 'КодОшибкиСервера')
  int code;
  @JsonKey(name: 'СообщениеОтСервера')
  String message;
  @JsonKey(name: 'Данные')
  List<Map<String, dynamic>> data;
}
