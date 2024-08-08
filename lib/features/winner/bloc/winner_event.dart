// ignore_for_file: depend_on_referenced_packages

import 'package:ekub_app/features/winner/model/winner_model.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

@immutable
sealed class WinnerEvent {}

class UnWinnerEvent extends WinnerEvent {}

class FetchWinnerEvent extends WinnerEvent {
  final int skip, take;
  FetchWinnerEvent({required this.take, required this.skip});
}

class FetchSingleWinnerEvent extends WinnerEvent {
  final int id;
  FetchSingleWinnerEvent({required this.id});
}

class AddWinnerEvent extends WinnerEvent {
  final WinnerModel winner;
  AddWinnerEvent({required this.winner});
}

class UpdateWinnerEvent extends WinnerEvent {
  final WinnerModel winner;
  UpdateWinnerEvent({required this.winner});
}

class DeleteWinnerEvent extends WinnerEvent {
  final int id;
  DeleteWinnerEvent({required this.id});
}
