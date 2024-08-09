import 'package:ekub_app/features/deposit/model/deposit_model.dart';
import 'package:ekub_app/features/deposit/provider/deposit_provider.dart';

class DepositRepository {
  DepositRepository({required this.depositProvider});
  DepositProvider depositProvider;

  //get all list of deposits
  Future<List<DepositModel>> getDeposits(int take, int skip) async {
    final response = await depositProvider.getDeposits(skip, take);
    print(response);
    return response['success']
        ? (response['data'] as List<dynamic>)
            .map((i) => DepositModel.fromJson(i))
            .toList()
        : throw Exception();
  }

  //get single deposits detail
  Future<DepositModel?> getSingleDepositDetail(int id) async {
    final response = await depositProvider.getSingleDepositsDetail(id);
    return response["success"] ? DepositModel.fromJson(response['data']) : null;
  }

  // create new deposit
  Future<Map<String, dynamic>> createDeposits(DepositModel deposit) async {
    final response = await depositProvider.createDeposits(deposit);
    return response;
  }

  // update new deposit
  Future<Map<String, dynamic>> updateDeposits(
      DepositModel deposit, int id) async {
    final response = await depositProvider.updateDeposits(deposit, id);
    return response;
  }

  // delete new deposit
  Future<Map<String, dynamic>> deleteDeposits(int id) async {
    final response = await depositProvider.deleteDeposits(id);
    return response;
  }
}
