import 'package:b2b_client_lk/src/features/user_data/domain/models/user_data_model.dart';

class ProfilePageState {
  final bool isLoading;
  final UserData userData;

  ProfilePageState({
    this.isLoading = false,
    required this.userData,
  });
}
