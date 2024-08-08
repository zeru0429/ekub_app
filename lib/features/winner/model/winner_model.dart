class WinnerModel {
  final int id;
  final int lotId;
  final int registeredBy;
  final DateTime createdAt;

  WinnerModel({
    required this.id,
    required this.lotId,
    required this.registeredBy,
    required this.createdAt,
  });

  factory WinnerModel.fromJson(Map<String, dynamic> json) {
    return WinnerModel(
      id: json['id'],
      lotId: json['lotId'],
      registeredBy: json['registeredBy'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lotId': lotId,
      'registeredBy': registeredBy,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
