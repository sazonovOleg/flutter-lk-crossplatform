import 'dart:async';

import 'package:b2b_client_lk/src/features/user_data/data/user_data_repository.dart';
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
      name: userDataResponse.name,
      token: userDataResponse.token,
    );

    await _userDataRepository.saveUserData(userData);

    _userData.value = true;
  }

  Future<UserData> getUserData() async {
    return _userDataRepository.getUserData();
  }

  void dispose() {
    _userData.close();
  }

  Future<void> setLoggedIn(bool value) async {
    await _userDataRepository.setLoggedIn(value);
  }

  Future<bool> isLoggedIn() async {
    final isLogin = await _userDataRepository.isLoggedIn();

    return isLogin;
  }
}
