import 'dart:async';

import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/features/auth/domain/models/auth_model.dart';
import 'package:b2b_client_lk/src/ui/pages/recovery_pass_page/recovery_pass_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RecoveryPassCubit extends Cubit<RecoveryPassState> {
  final AuthService _authService;

  RecoveryPassCubit(this._authService) : super(RecoveryPassState());

  TextEditingController loginController = TextEditingController();

  void init() {
    emit(RecoveryPassState(authModel: AuthModel.empty()));
  }

  Future<void> recoveryPass() async {
    final login = loginController.text;

    if (state.isShowEmailBtn) {
      emit(RecoveryPassState(isLoading: true));
      final authModel = await _authService.recoveryPass(login);

      emit(
        RecoveryPassState(
          isLoading: false,
          authModel: authModel,
        ),
      );
    }
  }

  void validateLogin(String value) {
    final isShow = value.length >= 3;

    emit(
      RecoveryPassState(
        isShowEmailBtn: isShow,
      ),
    );
  }

  void onBackPressed(BuildContext context) => context.pop();
}
