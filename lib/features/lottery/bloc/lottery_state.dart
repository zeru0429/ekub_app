import 'package:ekub_app/features/lottery/model/lottery_model.dart';
import 'package:equatable/equatable.dart';

sealed class LotteryState extends Equatable {
  const LotteryState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnLotteryState extends LotteryState {
  const UnLotteryState();

  @override
  String toString() => 'UnLotteryState';
}

/// Initialized
class InLotteryState extends LotteryState {
  const InLotteryState({required this.lotterys});

  final List<LotteryModel> lotterys;

  @override
  String toString() => 'InLotteryState';

  @override
  List<Object> get props => [lotterys];
}

// Error state
class ErrorLotteryState extends LotteryState {
  const ErrorLotteryState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorLotteryState';

  @override
  List<Object> get props => [errorMessage];
}

// Loading state
class LoadingLotteryState extends LotteryState {
  const LoadingLotteryState();

  @override
  String toString() => 'LoadingLotteryState';

  @override
  List<Object> get props => [];
}

// message state
class SucessState extends LotteryState {
  const SucessState({required this.message});
  final String message;

  @override
  String toString() => 'Sucess Lottery State';

  @override
  List<Object> get props => [];
}
