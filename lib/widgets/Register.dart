class Register {
  final String username;
  final String password;
  final String email;

  Register({
    this.username,
    this.password,
    this.email,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    username: json['username'] as String,
    password: json['password'] as String,
    email: json['email'] as String,
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "email": email,
  };
}
