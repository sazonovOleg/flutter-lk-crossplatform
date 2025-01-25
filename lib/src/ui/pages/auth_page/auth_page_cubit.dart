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

  late StreamSubscription? _streamSubscription;

  Future<void> init() async {
    _streamSubscription = _authService.registrationState.listen((value) {
      if (value.isNotEmpty) {
        emit(AuthPageState(
          authModel: state.authModel,
          isLoading: state.isLoading,
          registrationMessage: value,
        ));
      }
    });
  }

  Future<void> goToRecoveryPassPage(BuildContext context) async {
    await context.pushNamed(RecoveryPassRoute.pageName);
  }

  bool isShowBtn() {
    final isLogin = loginController.text.length >= 3;
    final isPass = passController.value.text.length >= 3;

    return isLogin && isPass;
  }

  Future<void> login() async {
    final email = loginController.text;
    final password = passController.text;

    if (isShowBtn()) {
      emit(AuthPageState(isLoading: true));
      try {
        final authModel = await _authService.signIn(
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

  Future<void> registration() async {
    final email = loginController.text;
    final password = passController.text;

    if (isShowBtn()) {
      emit(AuthPageState(isLoading: true));
      try {
        final authModel = await _authService.registration(
          email,
          password,
        );

        if (state.registrationMessage.isNotEmpty) {
          Future.delayed(Duration(seconds: 2)).then(
            (value) => {
              emit(AuthPageState(
                authModel: authModel,
                isLoading: false,
                registrationMessage: '',
              )),
            },
          );
        }
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
    final isLogin = value.length >= 3;

    emit(
      AuthPageState(
        isLogin: isLogin,
        isPass: state.isPass,
      ),
    );
  }

  void validatePass(String value) {
    final isPass = value.length >= 3;

    emit(
      AuthPageState(
        isLogin: state.isLogin,
        isPass: isPass,
      ),
    );
  }

  void setRegistrationView(bool value) {
    loginController.clear();
    passController.clear();
    emit(
      AuthPageState(
        isRegistration: value,
      ),
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
