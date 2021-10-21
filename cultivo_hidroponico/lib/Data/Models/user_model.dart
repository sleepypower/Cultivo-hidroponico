
class User {
  User({
    required this.mail,
    required this.firstName,
    required this.lastName,
    required this.password,
  });

  final String mail;
  final String firstName;
  final String lastName;
  final String password;

  Map<String, dynamic> toMap() {
    return {
      'mail': mail,
      'first_name': firstName,
      'last_name': lastName,
      'password': password
    };
  }



}
