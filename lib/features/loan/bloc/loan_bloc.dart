// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:ekub_app/features/loan/bloc/index.dart';
import 'package:ekub_app/features/loan/repository/loan_repository.dart';

class LoanBloc extends Bloc<LoanEvent, LoanState> {
  final LoanRepository loanRepository;
  LoanBloc(unLoanState, {required this.loanRepository})
      : super(const UnLoanState()) {
    //fetch all Loan
    on<FetchLoanEvent>((event, emit) async {
      emit(const LoadingLoanState());
      try {
        final result = await loanRepository.getLoan(event.take, event.skip);
        emit(InLoanState(loans: result));
      } catch (e) {
        emit(ErrorLoanState(e.toString()));
      }
    });

    //add new Loan
    on<AddLoanEvent>((event, emit) async {
      emit(const LoadingLoanState());
      try {
        final result = await loanRepository.createLoan(event.loan);
        emit(SucessState(message: result['message']));
      } catch (e) {
        emit(ErrorLoanState(e.toString()));
      }
    });

    //update new Loan
    on<UpdateLoanEvent>((event, emit) async {
      emit(const LoadingLoanState());
      try {
        final result =
            await loanRepository.updateLoan(event.loan, event.loan.id);
        emit(SucessState(message: result['message']));
      } catch (e) {
        emit(ErrorLoanState(e.toString()));
      }
    });

    // delete new Loan
    on<DeleteLoanEvent>((event, emit) async {
      emit(const LoadingLoanState());
      try {
        final result = await loanRepository.deleteLoan(event.id);
        emit(SucessState(message: result['message']));
      } catch (e) {
        emit(ErrorLoanState(e.toString()));
      }
    });
  }
}
