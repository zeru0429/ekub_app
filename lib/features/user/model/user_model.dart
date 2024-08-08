import 'package:ekub_app/common/model/enums.dart';

class User {
  final int id;
  final String email;
  final String password;
  final Role role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String firstName;
  final String middleName;
  final String lastName;
  final Status activeStatus;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.activeStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      role:
          Role.values.firstWhere((e) => e.toString() == 'Role.${json['role']}'),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      activeStatus: Status.values
          .firstWhere((e) => e.toString() == 'Status.${json['activeStatus']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'role': role.toString().split('.').last,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'activeStatus': activeStatus.toString().split('.').last,
    };
  }
}
