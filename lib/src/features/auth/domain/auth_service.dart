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

  Stream<bool> get authState => _authState.stream;

  Future<void> logoOut() async {
    await _authRepository.clear();
    await _userDataService.setLoggedIn(false);

    _authState.value = false;
  }

  Future<AuthModel> signInWithEmailAndPassword(
    String name,
    String password,
  ) async {
    return await authOnBackend(name, password);
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

  Future<bool> userLoggedIn() async {
    return _userDataService.isLoggedIn();
  }

  Future<bool> recoveryPass(String email) async {
    return _authRepository.recoveryPass(email);
  }

  Future<bool> checkRecoveryCode(String email) async {
    return _authRepository.checkRecoveryCode(email);
  }

  Future<bool> setNewPass(String newPass) async {
    return _authRepository.setNewPass(newPass);
  }

  void dispose() {
    _authState.close();
  }
}
