import 'package:b2b_client_lk/src/features/user_data/data/user_data_storage.dart';
import 'package:dio/dio.dart';
import 'error_interceptor.dart';
import 'on_request_interceptor.dart';

class ApiClient {
  final Dio dio = Dio();
  final UserDataStorage _userDataStorage;

  ///Start host with adb reverse tcp:3020 tcp:3020
  static const String _api = 'http://localhost:3020/';

  ApiClient(
    this._userDataStorage,
  ) {
    dio.options.baseUrl = _api;
    //dio.options.headers['Content-Type'] = 'application/json';

    dio.interceptors.add(OnError());
    dio.interceptors.add(
      OnRequest(
        _userDataStorage,
      ),
    );
  }
}
