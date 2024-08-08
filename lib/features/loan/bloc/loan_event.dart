// ignore_for_file: depend_on_referenced_packages

import 'package:ekub_app/features/loan/model/loans_model.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

@immutable
sealed class LoanEvent {}

class UnLoanEvent extends LoanEvent {}

class FetchLoanEvent extends LoanEvent {
  final int skip, take;
  FetchLoanEvent({required this.take, required this.skip});
}

class FetchSingleLoanEvent extends LoanEvent {
  final int id;
  FetchSingleLoanEvent({required this.id});
}

class AddLoanEvent extends LoanEvent {
  final LoansModel loan;
  AddLoanEvent({required this.loan});
}

class UpdateLoanEvent extends LoanEvent {
  final LoansModel loan;
  UpdateLoanEvent({required this.loan});
}

class DeleteLoanEvent extends LoanEvent {
  final int id;
  DeleteLoanEvent({required this.id});
}
