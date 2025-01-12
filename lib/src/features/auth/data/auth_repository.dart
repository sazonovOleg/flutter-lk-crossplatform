import 'package:b2b_client_lk/src/features/common/device_info/device_info.dart';
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

  Future<int?> sendDeviceInfo(DeviceInfo deviceInfo) async {
    final status = await _authApi.sendDeviceInfo(deviceInfo);

    return status;
  }

  Future<void> saveEmail(String email) async {
    await _userDataStorage.saveEmail(email);
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
