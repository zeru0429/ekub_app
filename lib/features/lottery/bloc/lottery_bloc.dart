// ignore_for_file: depend_on_referenced_packages

import 'package:ekub_app/features/lottery/bloc/index.dart';
import 'package:ekub_app/features/lottery/repository/lottory_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LotteryBloc extends Bloc<LotteryEvent, LotteryState> {
  final LottoryRepository lotteryRepository;
  LotteryBloc(unLotteryState, {required this.lotteryRepository})
      : super(const UnLotteryState()) {
    //fetch all Lottery
    on<FetchLotteryEvent>((event, emit) async {
      emit(const LoadingLotteryState());
      try {
        final result =
            await lotteryRepository.getLottery(event.take, event.skip);
        emit(InLotteryState(lotterys: result));
      } catch (e) {
        emit(ErrorLotteryState(e.toString()));
      }
    });

    //add new Lottery
    on<AddLotteryEvent>((event, emit) async {
      emit(const LoadingLotteryState());
      try {
        final result = await lotteryRepository.createLottery(event.lottery);
        emit(SucessState(message: result['message']));
      } catch (e) {
        emit(ErrorLotteryState(e.toString()));
      }
    });

    //update new Lottery
    on<UpdateLotteryEvent>((event, emit) async {
      emit(const LoadingLotteryState());
      try {
        final result = await lotteryRepository.updateLottery(
            event.lottery, event.lottery.id);
        emit(SucessState(message: result['message']));
      } catch (e) {
        emit(ErrorLotteryState(e.toString()));
      }
    });

    // delete new Lottery
    on<DeleteLotteryEvent>((event, emit) async {
      emit(const LoadingLotteryState());
      try {
        final result = await lotteryRepository.deleteLottery(event.id);
        emit(SucessState(message: result['message']));
      } catch (e) {
        emit(ErrorLotteryState(e.toString()));
      }
    });
  }
}
