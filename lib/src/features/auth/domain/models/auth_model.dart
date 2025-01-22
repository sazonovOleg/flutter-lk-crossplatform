class AuthModel {
  AuthModel({
    required this.statusCode,
    required this.message,
  });

  int statusCode;
  String message;

  AuthModel.empty()
      : statusCode = 0,
        message = 'Ошибка при обработке данных';
}