class UserData {
  UserData({
    required this.surname,
    required this.name,
    required this.lastName,
    required this.phone,
    required this.email,
  });

  String surname;
  String name;
  String lastName;
  String email;
  String phone;

  UserData.empty()
      : surname = '',
        name = '',
        lastName = '',
        email = '',
        phone = '';
}

class UserAddress {
  UserAddress({
    required this.address,
    required this.id,
  });

  String address;
  String id;

  UserAddress.empty()
      : id = '',
        address = '';
}
