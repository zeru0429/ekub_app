import 'package:ekub_app/features/deposit/model/deposit_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class DepositEvent extends Equatable {}

class LoadDepositEvent extends DepositEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadMoreDepositEvent extends DepositEvent {
  final int skip;
  final List<DepositModel> currentDeposits;
  LoadMoreDepositEvent({required this.skip, required this.currentDeposits});
  @override
  List<Object> get props => [];
}

class CreateDepositEvent extends DepositEvent {
  @override
  List<Object> get props => [];
}

class UpdateDepositEvent extends DepositEvent {
  @override
  List<Object> get props => [];
}

class DeleteDepositEvent extends DepositEvent {
  @override
  List<Object> get props => [];
}
