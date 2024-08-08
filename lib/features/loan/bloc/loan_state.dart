import 'package:ekub_app/features/loan/model/loans_model.dart';
import 'package:equatable/equatable.dart';

sealed class LoanState extends Equatable {
  const LoanState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnLoanState extends LoanState {
  const UnLoanState();

  @override
  String toString() => 'UnLoanState';
}

/// Initialized
class InLoanState extends LoanState {
  const InLoanState({required this.loans});

  final List<LoansModel> loans;

  @override
  String toString() => 'InLoanState';

  @override
  List<Object> get props => [loans];
}

// Error state
class ErrorLoanState extends LoanState {
  const ErrorLoanState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorLoanState';

  @override
  List<Object> get props => [errorMessage];
}

// Loading state
class LoadingLoanState extends LoanState {
  const LoadingLoanState();

  @override
  String toString() => 'LoadingLoanState';

  @override
  List<Object> get props => [];
}

// message state
class SucessState extends LoanState {
  const SucessState({required this.message});
  final String message;

  @override
  String toString() => 'Sucess Loan State';

  @override
  List<Object> get props => [];
}
