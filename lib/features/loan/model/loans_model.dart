class LoansModel {
  final int id;
  final int lotId;
  final int userId;
  final double amount;
  final DateTime createdAt;

  LoansModel({
    required this.id,
    required this.lotId,
    required this.userId,
    required this.amount,
    required this.createdAt,
  });

  factory LoansModel.fromJson(Map<String, dynamic> json) {
    return LoansModel(
      id: json['id'],
      lotId: json['lotId'],
      userId: json['userId'],
      amount: double.parse(json['amount']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lotId': lotId,
      'userId': userId,
      'amount': amount,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
