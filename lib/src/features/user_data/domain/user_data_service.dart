import 'dart:async';

import 'package:b2b_client_lk/src/features/user_data/data/user_data_repository.dart';
import 'models/user_data_model.dart';

class UserDataService {
  final UserDataRepository _userDataRepository;

  UserDataService(
    this._userDataRepository,
  );

  Future<void> initUserData() async {
    await _userDataRepository.initUserData();
  }

  Future<UserData> getUserData() async {
    return _userDataRepository.getUserDataFromStorage();
  }

  Future<void> setLoggedIn(bool value) async {
    await _userDataRepository.setLoggedIn(value);
  }

  bool isLoggedIn()  {
    final isLogin = _userDataRepository.isLoggedIn();

    return isLogin;
  }
}
