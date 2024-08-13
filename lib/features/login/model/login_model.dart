class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  // Factory constructor for creating a new LoginModel instance from a map
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
    );
  }

  // Method for converting a LoginModel instance to a map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
