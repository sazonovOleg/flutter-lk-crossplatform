import 'dart:async';

import 'package:b2b_client_lk/src/features/auth/data/auth_repository.dart';
import 'package:b2b_client_lk/src/features/user_data/domain/user_data_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/device_info/device_info.dart';
import 'auth_exceptions.dart';

enum AuthState { loggedIn, loggedOut }

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

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _authRepository.saveEmail(email);
      await _authRepository.savePassword(password);
      await authOnBackend();
    } on Exception catch (e) {
      if (e.toString() == 'user-not-found') {
        throw UserNotFoundException();
      } else if (e.toString() == 'wrong-password') {
        throw WrongPasswordException();
      } else if (e.toString() == 'Given String is empty or null') {
        throw EmptyStringException();
      } else if (e.toString() == 'invalid-email') {
        throw InvalidEmailException();
      }
    }
  }

  Future<void> authOnBackend() async {
    final deviceInfo = await DeviceInfo().getDeviceInfo(null);
    final status = await _authRepository.sendDeviceInfo(deviceInfo);

    if (status != null && status == 200) {
      await _userDataService.setLoggedIn(true);
      _authState.value = true;
    } else {
      throw Exception();
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
