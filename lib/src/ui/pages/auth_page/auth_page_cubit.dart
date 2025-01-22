import 'dart:async';

import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/ui/common/error_handler.dart';
import 'package:b2b_client_lk/src/ui/pages/recovery_pass_page/recovery_pass_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'auth_page_state.dart';

class AuthPageCubit extends Cubit<AuthPageState> with ErrorHandler {
  final AuthService _authService;

  AuthPageCubit(
    this._authService,
  ) : super(AuthPageState());

  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> goToRecoveryPassPage(BuildContext context) async {
    await context.pushNamed(RecoveryPassRoute.pageName);
  }

  bool isShowLoginBtn() {
    final isLogin = loginController.text.length >= 3;
    final isPass = passController.value.text.length >= 3;

    return isLogin && isPass;
  }

  Future<void> login() async {
    final email = loginController.text;
    final password = passController.text;

    if (isShowLoginBtn()) {
      emit(AuthPageState(isLoading: true));
      try {
        final authModel = await _authService.signInWithEmailAndPassword(
          email,
          password,
        );

        emit(AuthPageState(
          authModel: authModel,
          isLoading: false,
        ));
      } on Exception catch (e) {
        handleError(
          e,
        );
        emit(AuthPageState(isLoading: false));
      }
    }
  }

  void showPass() {
    emit(AuthPageState(isShowPass: !state.isShowPass));
  }

  void validateEmail(String value) {
    final isShow = value.contains('@');

    emit(
      AuthPageState(
        isShowLoginBtn: isShow,
      ),
    );
  }
}
