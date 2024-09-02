class User {
  final String fname;
  final String password;
  final String email;

  User({required this.fname, required this.password, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fname: json['fname'],
      password: json['password'],
      email: json['email'],
    );
}
}
