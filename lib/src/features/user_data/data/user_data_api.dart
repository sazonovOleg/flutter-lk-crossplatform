import 'package:dio/dio.dart';

import 'models/user_data_response_model.dart';

class UserDataApi {
  final Dio _dio;

  UserDataApi(this._dio);

  Future<UserDataResponse> getUserData() async {
    final response = await _dio.get(
      'user_data/param?',
    );

    return userDataFromJson(response.data).first;
  }

  Future<void> saveAddress(
    String country,
    String city,
    String street,
    String house,
    String apartment,
  ) async {
    await _dio.put(
      'user_data/param?&country=$country&street=$street&house=$house&apartment=$apartment&city=$city',
    );
  }
}
