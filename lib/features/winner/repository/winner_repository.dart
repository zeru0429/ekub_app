import 'package:ekub_app/features/winner/model/winner_model.dart';
import 'package:ekub_app/features/winner/provider/winner_provider.dart';

class WinnerRepository {
  WinnerProvider winnerProvider;
  WinnerRepository({required this.winnerProvider});

  //get all list of Winner
  Future<List<WinnerModel>> getWinner(int take, int skip) async {
    final response = await winnerProvider.getAllWinner(skip, take);
    return response['success']
        ? (response['data'] as List<dynamic>)
            .map((i) => WinnerModel.fromJson(i))
            .toList()
        : throw Exception();
  }

  //get single Winner detail
  Future<WinnerModel?> getSingleWinnerDetail(int id) async {
    final response = await winnerProvider.getSingleWinner(id);
    return response["success"]
        ? WinnerModel.fromJson(response['data'])
        : throw Exception();
  }

  // create new Winner
  Future<Map<String, dynamic>> createWinner(WinnerModel Winner) async {
    final response = await winnerProvider.addWinner(Winner.toJson());
    return response;
  }

  // update new Winner
  Future<Map<String, dynamic>> updateWinner(WinnerModel Winner, int id) async {
    final response = await winnerProvider.updateWinner(Winner.toJson(), id);
    return response;
  }

  // delete new Winner
  Future<Map<String, dynamic>> deleteWinner(int id) async {
    final response = await winnerProvider.deleteWinner(id);
    return response;
  }
}
