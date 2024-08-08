class ProfileModel {
  final int id;
  final int lotId;
  final int userId;
  final String firstName;
  final String middleName;
  final String lastName;
  final String gender;
  final String city;
  final String street;
  final DateTime createdAt;

  ProfileModel({
    required this.id,
    required this.lotId,
    required this.userId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.city,
    required this.street,
    required this.createdAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      lotId: json['lotId'],
      userId: json['userId'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      gender: json['gender'],
      city: json['city'],
      street: json['street'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lotId': lotId,
      'userId': userId,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'gender': gender,
      'city': city,
      'street': street,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
