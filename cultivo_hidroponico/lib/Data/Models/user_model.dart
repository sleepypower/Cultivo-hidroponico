
class UserModel {
  UserModel({
    required this.mail,
    required this.firstName,
    required this.lastName,
    required this.password,
  });

  String mail;
  String firstName;
  String lastName;
  String password;

  Map<String, dynamic> toMap() {
    return {
      'mail': mail,
      'first_name': firstName,
      'last_name': lastName,
      'password': password
    };
  }

  @override
  String toString() {
    return 'User{mail: $mail, first_name: $firstName, last_name: $lastName}';
  }

}
