import 'package:b2b_client_lk/src/features/auth/domain/models/auth_model.dart';

class AuthPageState {
  final bool isLoading;
  final bool isLogin;
  final bool isPass;
  final bool isShowPass;
  AuthModel? authModel = AuthModel.empty();

  AuthPageState({
    this.isLoading = false,
    this.isLogin = false,
    this.isPass = false,
    this.isShowPass = true,
    this.authModel,
  });
}