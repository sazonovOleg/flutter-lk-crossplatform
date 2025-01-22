class UserData {
  UserData({
    required this.name,
    required this.token,
  });

  String name;
  String token;

  UserData.empty()
      : name = '',
        token = '';
}
