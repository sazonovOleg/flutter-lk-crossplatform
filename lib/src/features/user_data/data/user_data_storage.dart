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
    final value = await _hiveStorage.getValue(_userData) ??
        UserDataResponse(
          surname: '',
          name: '',
          lastName: '',
          phone: '',
          email: '',
        );

    return value;
  }

  Future<void> saveUserData(UserDataResponse userData) async {
    await _hiveStorage.saveValue(_userData, userData);
  }

  Future<void> saveEmail(String email) async {
    final userData = await getUserData();
    userData.email = email;
    saveUserEmail(email);
    await _hiveStorage.saveValue(_userData, userData);
  }

  Future<void> clear() async {
    await _hiveStorage.saveValue(
      _userData,
      UserDataResponse(
        surname: '',
        name: '',
        lastName: '',
        phone: '',
        email: '',
      ),
    );
  }

  void saveUserPin(String pin) {
    _sharedPref.setString('user_pin', pin);
  }

  Future<String?> getUserPin() {
    return _sharedPref.getString('user_pin');
  }

  void saveUserPassword(String password) {
    _sharedPref.setString('user_password', password);
  }

  Future<String?> getUserPassword() async {
    final pass = await _sharedPref.getString('user_password');

    return pass ?? '';
  }

  void saveUserEmail(String email) {
    _sharedPref.setString('user_email_pref', email);
  }

  Future<String> getUserEmail() async {
    final email = await _sharedPref.getString('user_email_pref');

    return email ?? '';
  }

  Future<void> setLoggedIn(bool value) async {
    await _sharedPref.setBool('login_user', value);
  }

  Future<bool?> isLoggedIn() {
    return _sharedPref.getBool('login_user');
  }

  void skipPinCode(String key, bool value) {
    _sharedPref.setBool('user_pass_pin_$key', value);
  }

  Future<bool?> isUserPin(String key) async {
    return _sharedPref.getBool('user_pass_pin_$key');
  }
}
