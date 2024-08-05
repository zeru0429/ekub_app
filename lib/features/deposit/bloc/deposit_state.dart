import 'package:ekub_app/features/deposit/model/deposit_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
sealed class DepositState extends Equatable {
  const DepositState();
}

class InitialDepositState extends DepositState {
  const InitialDepositState();

  @override
  String toString() => "deposit initial state";

  @override
  List<Object> get props => [];
}

class LoadingDepositState extends DepositState {
  @override
  String toString() => "Loading deposit state";

  @override
  List<Object> get props => [];
}

class LoadingMoreDepositState extends DepositState {
  @override
  String toString() => "Loading more deposit state";

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ErrorDepositState extends DepositState {
  ErrorDepositState({required this.error});
  String error;

  @override
  String toString() => "Error deposit state";

  @override
  List<Object> get props => [error];
}

class LoadedDepositState extends DepositState {
  const LoadedDepositState({required this.deposits});
  final List<DepositModel> deposits;

  @override
  String toString() => "Loaded deposit state";

  @override
  List<Object?> get props => [deposits];
}

class DepositEndOfPageState extends DepositState {
  const DepositEndOfPageState({required this.deposits});
  final List<DepositModel> deposits;

  @override
  String toString() => "End of page deposit state";

  @override
  List<Object?> get props => [deposits];
}
