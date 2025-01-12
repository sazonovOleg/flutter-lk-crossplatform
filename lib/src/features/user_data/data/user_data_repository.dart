import 'package:b2b_client_lk/src/features/user_data/domain/models/user_data_model.dart';

import 'models/user_data_response_model.dart';
import 'user_data_api.dart';
import 'user_data_storage.dart';

class UserDataRepository {
  final UserDataApi _userDataApi;
  final UserDataStorage _userDataStorage;

  UserDataRepository(
    this._userDataApi,
    this._userDataStorage,
  );

  Future<UserDataResponse> initUserData() async {
    final userDataResponse = await _userDataApi.getUserData();

    await _userDataStorage.saveUserData(userDataResponse);

    return userDataResponse;
  }

  Future<void> saveEmail(String email) async {
    await _userDataStorage.saveEmail(email);
  }

  Future<void> saveUserData(UserData userData) async {
    await _userDataStorage.saveUserData(
      UserDataResponse(
        surname: userData.surname,
        name: userData.name,
        lastName: userData.lastName,
        phone: userData.phone,
        email: userData.email,
      ),
    );
  }

  Future<UserData> getUserData() async {
    final userDataResponse = await _userDataStorage.getUserData();

    return UserData(
      surname: userDataResponse.surname,
      name: userDataResponse.name,
      lastName: userDataResponse.lastName,
      phone: userDataResponse.phone,
      email: userDataResponse.email,
    );
  }

  Future<void> saveAddress(
    String country,
    String city,
    String street,
    String house,
    String apartment,
  ) async {
    await _userDataApi.saveAddress(country, city, street, house, apartment);
  }

  void savePin(String pin) {
    _userDataStorage.saveUserPin(pin);
  }

  Future<String> getPin() async {
    final pin = await _userDataStorage.getUserPin() ?? '';

    return pin;
  }

  Future<String> getPassword() async {
    final password = await _userDataStorage.getUserPassword() ?? '';

    return password;
  }

  Future<void> setLoggedIn(bool value) async {
    await _userDataStorage.setLoggedIn(value);
  }

  Future<bool> isLoggedIn() async {
    final isLogin = await _userDataStorage.isLoggedIn();

    return isLogin ?? false;
  }

  void skipPinCode(String key, bool value) {
    _userDataStorage.skipPinCode(key, value);
  }

  Future<bool> isUserPin(String key) async {
    final pin = await _userDataStorage.isUserPin(key) ?? false;

    return pin;
  }
}
