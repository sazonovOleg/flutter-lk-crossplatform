import 'package:dio/dio.dart';

import 'error_model/api_error_model.dart';

class OnError extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response!.statusCode == 400) {
      final apiError = apiErrorFromJson(err.response!.data).first;
      handler.next(throw ApiException(apiError.message));
    } else {
      handler.reject(err);
    }
  }
}

class ApiException implements Exception {
  String errorMessage;

  ApiException(this.errorMessage) : super();
}

class SpecialApiException implements Exception {
  String errorMessage;
  List<Map<String, dynamic>> data;

  SpecialApiException(this.errorMessage, this.data) : super();
}
