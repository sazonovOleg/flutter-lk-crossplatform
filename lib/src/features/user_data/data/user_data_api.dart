import 'package:dio/dio.dart';

class UserDataApi {
  final Dio _dio;

  UserDataApi(this._dio);

  Future<Response?> getUserData() async {
    try {
      final res = await _dio.get('api/user/');

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
}
