class AuthModel {
  AuthModel({
    required this.statusCode,
    required this.message,
    this.token,
    this.newPass,
  });

  int statusCode;
  String message;
  String? token;
  String? newPass;

  AuthModel.empty()
      : statusCode = 0,
        token = '',
        newPass = '',
        message = '';
}