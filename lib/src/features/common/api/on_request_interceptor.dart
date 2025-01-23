import 'dart:convert';
import 'package:b2b_client_lk/src/features/user_data/data/user_data_storage.dart';
import 'package:dio/dio.dart';

class OnRequest extends Interceptor {
  OnRequest();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    super.onRequest(options, handler);
  }
}
