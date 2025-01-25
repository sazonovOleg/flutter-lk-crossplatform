import 'package:b2b_client_lk/src/features/auth/domain/models/auth_model.dart';
import 'package:b2b_client_lk/src/features/user_data/data/user_data_storage.dart';

import 'auth_api.dart';

class AuthRepository {
  final UserDataStorage _userDataStorage;
  final AuthApi _authApi;

  AuthRepository(
    this._authApi,
    this._userDataStorage,
  );

  Future<void> clear() async {
    await _userDataStorage.clear();
  }

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

  Future<void> savePassword(String password) async {
    _userDataStorage.saveUserPassword(password);
  }

  Future<String?> getPassword() async {
    return _userDataStorage.getUserPassword();
  }

  Future<bool> recoveryPass(String email) async {
    final isRecovery = await _authApi.recoveryPass(email);

    return isRecovery;
  }

  Future<bool> checkRecoveryCode(String code) async {
    final isChecked = await _authApi.checkRecoveryCode(code);

    return isChecked;
  }

  Future<bool> setNewPass(String newPass) async {
    final isChecked = await _authApi.setNewPass(newPass);

    return isChecked;
  }
}
