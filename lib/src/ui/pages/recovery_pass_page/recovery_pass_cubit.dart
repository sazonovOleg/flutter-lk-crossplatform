import 'dart:async';

import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/ui/pages/main_page/main_page_route.dart';
import 'package:b2b_client_lk/src/ui/pages/recovery_pass_page/recovery_pass_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RecoveryPassCubit extends Cubit<RecoveryPassState> {
  final AuthService _authService;

  RecoveryPassCubit(
    this._authService,
  ) : super(const RecoveryPassState());

  TextEditingController emailController = TextEditingController();
  TextEditingController recoveryCodeController = TextEditingController();
  TextEditingController enteredPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool enabledConfirmBtn = false;

  void onBackPressed(BuildContext context) => context.pop();

  Future<void> recoveryPass() async {
    final email = emailController.text;
    final isRecovery = await _authService.recoveryPass(email);

    emit(RecoveryPassState(userEmail: emailController.text, isRecovery: isRecovery));
  }

  Future<void> checkRecoveryCode() async {
    final code = recoveryCodeController.text;
    final isChecked = await _authService.checkRecoveryCode(code);

    emit(RecoveryPassState(isChecked: isChecked));

    if (state.isChecked) {
      emit(const RecoveryPassState(isNewPassword: true));
    }
  }

  Future<void> setNewPass(BuildContext context) async {
    final enteredPass = enteredPassController.text;
    final confirmPass = confirmPassController.text;

    if (enteredPass == confirmPass) {
      final isNewPass = await _authService.setNewPass(enteredPass);

      if (isNewPass && context.mounted) {
        context.pushReplacementNamed(MainPageRoute.pageName);
      }
    }
  }

  void validateEmail(String value) {
    final isShow = value.contains('@');

    emit(
      RecoveryPassState(
        isShowEmailBtn: isShow,
      ),
    );
  }

  void validateCode(String value) {
    emit(
      RecoveryPassState(
        enabledVerifyBtn: value.length == 6 ? true : false,
        isRecovery: true,
      ),
    );
  }

  void validatePass(String value) {
    final pass = enteredPassController.text;

    emit(
      RecoveryPassState(
        enabledConfirmPassBtn: value == pass ? true : false,
        isNewPassword: true,
      ),
    );
  }

  void showNewPassword() {
    emit(
      RecoveryPassState(
        isShowNewPass: !state.isShowNewPass,
        isNewPassword: true,
        enabledConfirmPassBtn: enabledConfirmBtn,
      ),
    );
  }

  void showConfirmPass() {
    emit(
      RecoveryPassState(
        isShowConfirmPass: !state.isShowConfirmPass,
        isNewPassword: true,
        enabledConfirmPassBtn: enabledConfirmBtn,
      ),
    );
  }
}
