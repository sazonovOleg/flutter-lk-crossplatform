import 'package:b2b_client_lk/src/features/common/device_info/device_info.dart';
import 'package:dio/dio.dart';

class AuthApi {
  final Dio _dio;
  AuthApi(this._dio);

  Future<int?> sendDeviceInfo(DeviceInfo deviceInfo) async {
    final res = await _dio.put(
      'device_info/param?deviceId=${deviceInfo.deviceId}&platform=${deviceInfo.platform}&token=${deviceInfo.token}',
    );

    return res.statusCode;
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
