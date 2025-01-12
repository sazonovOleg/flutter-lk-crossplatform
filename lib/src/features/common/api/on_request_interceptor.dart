import 'dart:convert';
import 'package:b2b_client_lk/src/features/user_data/data/user_data_storage.dart';
import 'package:dio/dio.dart';

class OnRequest extends Interceptor {
  final UserDataStorage _userDataStorage;

  OnRequest(
    this._userDataStorage,
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final userLogin = await _userDataStorage.getUserEmail();
    final userPass = await _userDataStorage.getUserPassword();

    if (userLogin != '' && userPass != '') {
      options.headers['Authorization'] = 'Basic ${base64Encode(
        utf8.encode('$userLogin:$userPass'),
      )}';

      super.onRequest(options, handler);
    }
  }
}
