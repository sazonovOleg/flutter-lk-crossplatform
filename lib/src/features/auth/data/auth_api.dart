import 'package:dio/dio.dart';

class AuthApi {
  final Dio _dio;

  AuthApi(this._dio);

  Future<Response?> login(String name, String password) async {
    try {
      final res = await _dio.post(
        'api/auth/login',
        data: {
          'name': name,
          'password': password,
        },
      );

      return res;
    } on DioException catch (e, s) {
      print('DioException error ===== ${e.error}');
      print('DioException stackTrace ===== ${s}');
      print('DioException data ===== ${e.response?.data}');

      return e.response;
    } on Exception catch (e) {
      print('Error ===== ${e}');

      return null;
    }
  }

  Future<bool> recoveryPass(String email) async {
    ///TODO waiting for implementation on the backend
    // final response = await _dio.get('user_groups/param? $email');
    //
    //
    // await _dio.put('path');

    return true;
  }

  Future<bool> checkRecoveryCode(String code) async {
    ///TODO waiting for implementation on the backend
    // final response = await _dio.get('user_groups/param? $code');
    //
    //
    // await _dio.put('path');

    return true;
  }

  Future<bool> setNewPass(String newPass) async {
    ///TODO waiting for implementation on the backend
    // final response = await _dio.get('user_groups/param? $newPass');
    //
    //
    // await _dio.put('path');

    return true;
  }
}
