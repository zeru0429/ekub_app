import 'package:ekub_app/features/lottery/model/lottery_model.dart';
import 'package:ekub_app/features/lottery/provider/lottery_provider.dart';

class LottoryRepository {
  LotteryProvider lotteryProvider;
  LottoryRepository({required this.lotteryProvider});

  //get all list of Lottery
  Future<List<LotteryModel>> getLottery(int take, int skip) async {
    final response = await lotteryProvider.getAllLot(skip, take);
    return response['success']
        ? (response['data'] as List<dynamic>)
            .map((i) => LotteryModel.fromJson(i))
            .toList()
        : throw Exception();
  }

  //get single Lottery detail
  Future<LotteryModel?> getSingleLotteryDetail(int id) async {
    final response = await lotteryProvider.getSingleLot(id);
    return response["success"]
        ? LotteryModel.fromJson(response['data'])
        : throw Exception();
  }

  // create new Lottery
  Future<Map<String, dynamic>> createLottery(LotteryModel Lottery) async {
    final response = await lotteryProvider.addLot(Lottery.toJson());
    return response;
  }

  // update new Lottery
  Future<Map<String, dynamic>> updateLottery(
      LotteryModel Lottery, int id) async {
    final response =
        await lotteryProvider.updateLotProfile(Lottery.toJson(), id);
    return response;
  }

  // delete new Lottery
  Future<Map<String, dynamic>> deleteLottery(int id) async {
    final response = await lotteryProvider.deleteLot(id);
    return response;
  }
}
