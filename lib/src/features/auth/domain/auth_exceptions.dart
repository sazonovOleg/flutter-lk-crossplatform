class WeakPassException extends AuthException {
  WeakPassException()
      : super('Введенный пароль не удовлетворяет требованиям безопасности');
}

class EmptyStringException extends AuthException {
  EmptyStringException() : super('Введите логин/пароль');
}

class AlreadyExistsException extends AuthException {
  AlreadyExistsException()
      : super(
          'Учетная запись для этого адреса электронной почты уже существует',
        );
}

class UserNotFoundException extends AuthException {
  UserNotFoundException() : super('Пользователь не найден');
}

class InvalidEmailException extends AuthException {
  InvalidEmailException() : super('Некорректный email');
}

class WrongPasswordException extends AuthException {
  WrongPasswordException() : super('Неверный пароль');
}

class AuthException implements Exception {
  String errorMessage;
  AuthException(this.errorMessage) : super();
}
