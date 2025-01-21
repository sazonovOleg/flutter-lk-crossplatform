import 'dart:async';

import 'package:b2b_client_lk/src/features/auth/domain/auth_exceptions.dart';
import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/ui/common/error_handler.dart';
import 'package:b2b_client_lk/src/ui/components/show_message.dart';
import 'package:b2b_client_lk/src/ui/pages/recovery_pass_page/recovery_pass_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'auth_page_state.dart';

class AuthPageCubit extends Cubit<AuthPageState> with ErrorHandler {
  final AuthService _authService;

  AuthPageCubit(
    this._authService,
  ) : super(const AuthPageState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> goToRecoveryPassPage(BuildContext context) async {
    await context.pushNamed(RecoveryPassRoute.pageName);
  }

  bool isShowLoginBtn() {
    return emailController.text.contains('@');
  }

  Future<void> login() async {
    final email = emailController.text;
    final password = passController.text;

    if (email.contains('@') && password.isNotEmpty) {
      emit(const AuthPageState(isLoading: true));
      try {
        await _authService.signInWithEmailAndPassword(
          email,
          password,
        );
      } on AuthException catch (e) {
        AppMessages().showMessage(
          e.errorMessage,
        );
        emit(const AuthPageState(isLoading: false));
      } on Exception catch (e) {
        handleError(
          e,
        );
        emit(const AuthPageState(isLoading: false));
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
