// ignore_for_file: depend_on_referenced_packages

import 'package:ekub_app/features/lottery/model/lottery_model.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

@immutable
sealed class LotteryEvent {}

class UnLotteryEvent extends LotteryEvent {}

class FetchLotteryEvent extends LotteryEvent {
  final int skip, take;
  FetchLotteryEvent({required this.take, required this.skip});
}

class FetchSingleLotteryEvent extends LotteryEvent {
  final int id;
  FetchSingleLotteryEvent({required this.id});
}

class AddLotteryEvent extends LotteryEvent {
  final LotteryModel lottery;
  AddLotteryEvent({required this.lottery});
}

class UpdateLotteryEvent extends LotteryEvent {
  final LotteryModel lottery;
  UpdateLotteryEvent({required this.lottery});
}

class DeleteLotteryEvent extends LotteryEvent {
  final int id;
  DeleteLotteryEvent({required this.id});
}
