class DepositModel {
  final int id;
  final int lotId;
  final int userId;
  final int count;
  final String amount;
  final String commission;
  final String remainingAmountPerDeposit;
  final String remainingCommissionPerDeposit;
  final DateTime createdAt;

  DepositModel({
    required this.id,
    required this.lotId,
    required this.userId,
    required this.count,
    required this.amount,
    required this.commission,
    required this.remainingAmountPerDeposit,
    required this.remainingCommissionPerDeposit,
    required this.createdAt,
  });

  // Factory constructor to create an instance from JSON
  factory DepositModel.fromJson(Map<String, dynamic> json) {
    return DepositModel(
      id: json['id'],
      lotId: json['lotId'],
      userId: json['userId'],
      count: json['count'],
      amount: json['amount'],
      commission: json['commition'], // Note the key is 'commition' in the JSON
      remainingAmountPerDeposit: json['remainingAmountPerDeposit'],
      remainingCommissionPerDeposit: json['remainingCommissionPerDeposit'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lotId': lotId,
      'userId': userId,
      'count': count,
      'amount': amount,
      'commition': commission, // Note the key is 'commition' in the JSON
      'remainingAmountPerDeposit': remainingAmountPerDeposit,
      'remainingCommissionPerDeposit': remainingCommissionPerDeposit,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
