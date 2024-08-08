import 'package:ekub_app/common/model/profile_model.dart';

class LotteryModel {
  final int id;
  final ProfileModel profile;
  final int? categoryId;
  final int registeredBy;
  final bool isCompleted;
  final DateTime createdAt;
  final int remainingDay;
  final double remainingAmount;
  final double cumulativePayment;
  final int? loanCount;
  final int? returnedRemainingCont;
  final int? winnersCount;

  LotteryModel({
    required this.id,
    required this.profile,
    this.categoryId,
    required this.registeredBy,
    required this.isCompleted,
    required this.createdAt,
    required this.remainingDay,
    required this.remainingAmount,
    required this.cumulativePayment,
    this.loanCount,
    this.returnedRemainingCont,
    this.winnersCount,
  });

  factory LotteryModel.fromJson(Map<String, dynamic> json) {
    return LotteryModel(
      id: json['id'],
      profile: ProfileModel.fromJson(json["profile"]),
      categoryId: json['categoryId'],
      registeredBy: json['registeredBy'],
      isCompleted: json['isCompleted'],
      createdAt: DateTime.parse(json['createdAt']),
      remainingDay: json['remainingDay'],
      remainingAmount: double.parse(json['remainingAmount']),
      cumulativePayment: double.parse(json['cumulativePayment']),
      loanCount: json['_count'] == null ? null : json['_count']['loans'] as int,
      returnedRemainingCont: json['_count'] == null
          ? null
          : json['_count']['returnedRemaining'] as int,
      winnersCount:
          json['_count'] == null ? null : json['_count']['winners'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profile': profile.toJson(),
      'categoryId': categoryId,
      'registeredBy': registeredBy,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
      'remainingDay': remainingDay,
      'remainingAmount': remainingAmount.toString(),
      'cumulativePayment': cumulativePayment.toString(),
      'loanCount': loanCount,
      'returnedRemainingCont': returnedRemainingCont,
      'winnersCount': winnersCount,
    };
  }
}
