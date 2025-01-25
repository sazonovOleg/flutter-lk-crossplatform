class AuthModel {
  AuthModel({
    required this.statusCode,
    required this.message,
    this.token,
  });

  int statusCode;
  String message;
  String? token;
  bool? isLogin;

  AuthModel.empty()
      : statusCode = 0,
        token = '',
        isLogin = false,
        message = 'Ошибка сервера';
}