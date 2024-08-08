import 'package:ekub_app/features/loan/model/loans_model.dart';
import 'package:ekub_app/features/loan/provider/loan_provider.dart';

class LoanRepository {
  LoanProvider loanProvider;
  LoanRepository({required this.loanProvider});

  //get all list of Loan
  Future<List<LoansModel>> getLoan(int take, int skip) async {
    final response = await loanProvider.getAllLone(skip, take);
    return response['success']
        ? (response['data'] as List<dynamic>)
            .map((i) => LoansModel.fromJson(i))
            .toList()
        : throw Exception();
  }

  //get single Loan detail
  Future<LoansModel?> getSingleLoanDetail(int id) async {
    final response = await loanProvider.getSingleLone(id);
    return response["success"]
        ? LoansModel.fromJson(response['data'])
        : throw Exception();
  }

  // create new Loan
  Future<Map<String, dynamic>> createLoan(LoansModel loan) async {
    final response = await loanProvider.addLoan(loan.toJson());
    return response;
  }

  // update new Loan
  Future<Map<String, dynamic>> updateLoan(LoansModel loan, int id) async {
    final response = await loanProvider.updateLoan(loan.toJson(), id);
    return response;
  }

  // delete new Loan
  Future<Map<String, dynamic>> deleteLoan(int id) async {
    final response = await loanProvider.deleteLoan(id);
    return response;
  }
}
