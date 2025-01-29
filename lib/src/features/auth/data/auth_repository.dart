import 'package:b2b_client_lk/src/features/auth/domain/models/auth_model.dart';
import 'package:b2b_client_lk/src/features/user_data/data/user_data_storage.dart';

import 'auth_api.dart';

class AuthRepository {
  final AuthApi _authApi;

  const AuthRepository(
    this._authApi,
  );

  Future<AuthModel> login(String name, String password) async {
    final res = await _authApi.login(name, password);

    if (res != null) {
      return AuthModel(
        statusCode: res.statusCode ?? 0,
        message: res.data['message'] ?? '',
      );
    } else {
      print('ERROR -- Repository data error. Status code === ${res?.statusCode}');

      return AuthModel.empty();
    }
  }

  Future<AuthModel> registration(String name, String password) async {
    final res = await _authApi.registration(name, password);

    if (res != null) {
      return AuthModel(
        statusCode: res.statusCode ?? 0,
        message: res.data['message'] ?? '',
      );
    } else {
      print('ERROR -- Repository data error. Status code === ${res?.statusCode}');

      return AuthModel.empty();
    }
  }

  Future<AuthModel> recoveryPass(String name) async {
    final res = await _authApi.recoveryPass(name);

    if (res != null) {
      if (res.statusCode == 200) {
        return AuthModel(
          statusCode: res.statusCode ?? 0,
          message: res.data['message'] ?? '',
          newPass: res.data['password'],
        );
      } else {
        return AuthModel(
          statusCode: res.statusCode ?? 0,
          message: res.data['message'] ?? '',
        );
      }
    } else {
      print('ERROR -- Repository data error. Status code === ${res?.statusCode}');

      return AuthModel.empty();
    }
  }
}
