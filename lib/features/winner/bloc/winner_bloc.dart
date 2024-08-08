import 'package:ekub_app/features/winner/bloc/index.dart';
import 'package:ekub_app/features/winner/repository/winner_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WinnerBloc extends Bloc<WinnerEvent, WinnerState> {
  final WinnerRepository winnerRepository;
  WinnerBloc(unWinnerState, {required this.winnerRepository})
      : super(const UnWinnerState()) {
    //fetch all Winner
    on<FetchWinnerEvent>((event, emit) async {
      emit(const LoadingWinnerState());
      try {
        final result = await winnerRepository.getWinner(event.take, event.skip);
        emit(InWinnerState(winners: result));
      } catch (e) {
        emit(ErrorWinnerState(e.toString()));
      }
    });

    //add new Winner
    on<AddWinnerEvent>((event, emit) async {
      emit(const LoadingWinnerState());
      try {
        final result = await winnerRepository.createWinner(event.winner);
        emit(SucessState(message: result['message']));
      } catch (e) {
        emit(ErrorWinnerState(e.toString()));
      }
    });

    //update new Winner
    on<UpdateWinnerEvent>((event, emit) async {
      emit(const LoadingWinnerState());
      try {
        final result =
            await winnerRepository.updateWinner(event.winner, event.winner.id);
        emit(SucessState(message: result['message']));
      } catch (e) {
        emit(ErrorWinnerState(e.toString()));
      }
    });

    // delete new Winner
    on<DeleteWinnerEvent>((event, emit) async {
      emit(const LoadingWinnerState());
      try {
        final result = await winnerRepository.deleteWinner(event.id);
        emit(SucessState(message: result['message']));
      } catch (e) {
        emit(ErrorWinnerState(e.toString()));
      }
    });
  }
}
