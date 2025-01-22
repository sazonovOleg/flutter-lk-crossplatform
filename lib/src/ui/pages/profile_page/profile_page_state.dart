import 'package:b2b_client_lk/src/features/user_data/domain/models/user_data_model.dart';

class ProfilePageState {
  final bool isLoading;
  UserData? userData = UserData.empty();
  final String errorMessage;

  ProfilePageState({
    this.isLoading = false,
    this.userData,
    this.errorMessage = 'Ошибка при обработке данных'
  });
}
