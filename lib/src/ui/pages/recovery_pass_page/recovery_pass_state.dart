import 'package:b2b_client_lk/src/features/auth/domain/models/auth_model.dart';

class RecoveryPassState {
  final bool isLoading;
  final bool isShowEmailBtn;
  AuthModel? authModel = AuthModel.empty();

  RecoveryPassState({
    this.isLoading = false,
    this.isShowEmailBtn = false,
    this.authModel,
  });
}
