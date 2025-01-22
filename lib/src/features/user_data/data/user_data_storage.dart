import 'package:b2b_client_lk/src/features/common/hive_storage/hive_storage.dart';
import 'package:b2b_client_lk/src/features/common/shared_pref/shared_pref.dart';

import 'models/user_data_response_model.dart';

const _userData = 'userData';

class UserDataStorage {
  final HiveStorage _hiveStorage;
  final SharedPref _sharedPref;

  UserDataStorage(
    this._hiveStorage,
    this._sharedPref,
  );

  Future<UserDataResponse> getUserData() async {
    final value = await _hiveStorage.getValue(_userData) ?? UserDataResponse(name: '', token: '');

    return value;
  }

  Future<void> saveUserData(UserDataResponse userData) async {
    await _hiveStorage.saveValue(_userData, userData);
  }

  Future<void> clear() async {
    await _hiveStorage.saveValue(
      _userData,
      UserDataResponse(
        name: '',
        token: '',
      ),
    );
  }

  void saveUserPassword(String password) {
    _sharedPref.setString('user_password', password);
  }

  Future<String?> getUserPassword() async {
    final pass = await _sharedPref.getString('user_password');

    return pass ?? '';
  }

  Future<void> setLoggedIn(bool value) async {
    await _sharedPref.setBool('login_user', value);
  }

  bool isLoggedIn() {
    final isLoggedIn = _sharedPref.getBool('login_user');

    if (isLoggedIn != null) {
      return isLoggedIn;
    } else {
      return false;
    }
  }
}
