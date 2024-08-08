import 'package:ekub_app/features/loan/model/loans_model.dart';
import 'package:ekub_app/features/lottery/provider/lottery_provider.dart';

class LottoryRepository {
  LotteryProvider lotteryProvider;
  LottoryRepository({required this.lotteryProvider});

  //get all list of Loan
  Future<List<LoansModel>> getLoan(int take, int skip) async {
    final response = await lotteryProvider.getAllLot(skip, take);
    return response['success']
        ? (response['data'] as List<dynamic>)
            .map((i) => LoansModel.fromJson(i))
            .toList()
        : throw Exception();
  }

  //get single Loan detail
  Future<LoansModel?> getSingleLoanDetail(int id) async {
    final response = await lotteryProvider.getSingleLot(id);
    return response["success"]
        ? LoansModel.fromJson(response['data'])
        : throw Exception();
  }

  // create new Loan
  Future<Map<String, dynamic>> createLoan(LoansModel loan) async {
    final response = await lotteryProvider.addLot(loan.toJson());
    return response;
  }

  // update new Loan
  Future<Map<String, dynamic>> updateLoan(LoansModel loan, int id) async {
    final response = await lotteryProvider.updateLotProfile(loan.toJson(), id);
    return response;
  }

  // delete new Loan
  Future<Map<String, dynamic>> deleteLoan(int id) async {
    final response = await lotteryProvider.deleteLot(id);
    return response;
  }
}
