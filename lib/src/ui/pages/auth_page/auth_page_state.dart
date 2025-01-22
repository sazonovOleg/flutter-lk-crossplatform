import 'package:b2b_client_lk/src/features/auth/domain/models/auth_model.dart';

class AuthPageState {
  final bool isLoading;
  final bool isShowLoginBtn;
  final bool isShowPass;
  AuthModel? authModel = AuthModel.empty();

  AuthPageState({
    this.isLoading = false,
    this.isShowLoginBtn = false,
    this.isShowPass = true,
    this.authModel,
  });
}