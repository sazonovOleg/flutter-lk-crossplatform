import 'dart:async';
import 'package:b2b_client_lk/src/features/user_data/data/user_data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'models/user_data_model.dart';

class UserDataService {
  final UserDataRepository _userDataRepository;

  UserDataService(
    this._userDataRepository,
  );

  final _userData = BehaviorSubject<bool>.seeded(
    false,
  );

  Stream<bool> get userData => _userData.stream;

  Future<void> initUserData() async {
    final userDataResponse = await _userDataRepository.initUserData();

    final userData = UserData(
      surname: userDataResponse.surname,
      name: userDataResponse.name,
      lastName: userDataResponse.lastName,
      phone: userDataResponse.phone,
      email: userDataResponse.email,
    );

    await _userDataRepository.saveUserData(userData);

    _userData.value = true;
  }

  Future<UserData> getUserData() async {
    return _userDataRepository.getUserData();
  }

  Future<void> saveAddress(
    String country,
    String city,
    String street,
    String house,
    String apartment,
  ) async {
    await _userDataRepository.saveAddress(
      country,
      city,
      street,
      house,
      apartment,
    );
  }

  void dispose() {
    _userData.close();
  }

  Future<String> getPin() async {
    final pin = await _userDataRepository.getPin();

    return pin;
  }

  Future<String> getPassword() async {
    return _userDataRepository.getPassword();
  }

  Future<void> setLoggedIn(bool value) async {
    await _userDataRepository.setLoggedIn(value);
  }

  Future<bool> isLoggedIn() async {
    final isLogin = await _userDataRepository.isLoggedIn();

    return isLogin;
  }
}
