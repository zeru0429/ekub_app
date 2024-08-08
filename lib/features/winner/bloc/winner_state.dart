// ignore_for_file: non_constant_identifier_names

import 'package:ekub_app/features/winner/model/winner_model.dart';
import 'package:equatable/equatable.dart';

sealed class WinnerState extends Equatable {
  const WinnerState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnWinnerState extends WinnerState {
  const UnWinnerState();

  @override
  String toString() => 'UnWinnerState';
}

/// Initialized
class InWinnerState extends WinnerState {
  const InWinnerState({required this.winners});

  final List<WinnerModel> winners;

  @override
  String toString() => 'InWinnerState';

  @override
  List<Object> get props => [winners];
}

// Error state
class ErrorWinnerState extends WinnerState {
  const ErrorWinnerState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorWinnerState';

  @override
  List<Object> get props => [errorMessage];
}

// Loading state
class LoadingWinnerState extends WinnerState {
  const LoadingWinnerState();

  @override
  String toString() => 'LoadingWinnerState';

  @override
  List<Object> get props => [];
}

// message state
class SucessState extends WinnerState {
  const SucessState({required this.message});
  final String message;

  @override
  String toString() => 'Sucess Winner State';

  @override
  List<Object> get props => [];
}
