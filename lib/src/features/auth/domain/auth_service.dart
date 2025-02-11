import 'dart:async';

import 'package:b2b_client_lk/src/features/auth/data/auth_repository.dart';
import 'package:b2b_client_lk/src/features/auth/domain/models/auth_model.dart';
import 'package:b2b_client_lk/src/features/user_data/domain/user_data_service.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  final AuthRepository _authRepository;
  final UserDataService _userDataService;

  AuthService(
    this._authRepository,
    this._userDataService,
  );

  final _authState = BehaviorSubject<bool>.seeded(false);
  final _registrationState = BehaviorSubject<String>.seeded('');

  Stream<bool> get authState => _authState.stream;

  Stream<String> get registrationState => _registrationState.stream;

  Future<void> logoOut() async {
    await _userDataService.setLoggedIn(false);

    _authState.value = false;
  }

  Future<AuthModel> signIn(
    String name,
    String password,
  ) async {
    return await authOnBackend(name, password);
  }

  Future<AuthModel> registration(
    String name,
    String password,
  ) async {
    return await registrationOnBackend(name, password);
  }

  Future<AuthModel> authOnBackend(String name, String password) async {
    final authModel = await _authRepository.login(name, password);

    if (authModel.statusCode == 200) {
      await _userDataService.setLoggedIn(true);
      _authState.value = true;

      return authModel;
    } else {
      return authModel;
    }
  }

  Future<AuthModel> registrationOnBackend(String name, String password) async {
    final authModel = await _authRepository.registration(name, password);

    if (authModel.statusCode == 200) {
      _registrationState.value = 'Регистрация успешно завершена.';

      return authModel;
    } else {
      return authModel;
    }
  }

  bool userLoggedIn() {
    return _userDataService.isLoggedIn();
  }

  Future<AuthModel> recoveryPass(String name) async {
    final authModel = await _authRepository.recoveryPass(name);

    return authModel;
  }

  void dispose() {
    _authState.close();
  }
}
