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

  Future<void> saveUserData(UserData userData) async {
    await _userDataStorage.saveUserData(
      UserDataResponse(
        name: userData.name,
        token: userData.token,
      ),
    );
  }

  Future<UserData> getUserData() async {
    final userDataResponse = await _userDataStorage.getUserData();

    return UserData(
      name: userDataResponse.name,
      token: userDataResponse.token,
    );
  }

  Future<void> setLoggedIn(bool value) async {
    await _userDataStorage.setLoggedIn(value);
  }

  Future<bool> isLoggedIn() async {
    final isLogin = await _userDataStorage.isLoggedIn();

    return isLogin ?? false;
  }
}
