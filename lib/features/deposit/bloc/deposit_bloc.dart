import 'dart:math';

import 'package:ekub_app/features/deposit/bloc/deposit_event.dart';
import 'package:ekub_app/features/deposit/bloc/deposit_state.dart';
import 'package:ekub_app/features/deposit/model/deposit_model.dart';
import 'package:ekub_app/features/deposit/repository/deposit_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  final DepositRepository depositRepository;
  DepositBloc({required this.depositRepository})
      : super(const InitialDepositState()) {
    //  logic of loading deposit state
    on<LoadDepositEvent>((event, emit) async {
      print("0000000000000000000000000000");
      emit(LoadingDepositState());
      try {
        final deposits = await depositRepository.getDeposits(20, 0);
        print(deposits);
        emit(LoadedDepositState(deposits: deposits));
      } catch (e) {
        print(e);
        emit(ErrorDepositState(error: e.toString()));
      }
    });

    //  logic of loading more deposit state
    on<LoadMoreDepositEvent>((event, emit) async {
      late List<DepositModel> current = event.currentDeposits;
      emit(LoadingMoreDepositState());
      try {
        final deposits = await depositRepository.getDeposits(10, event.skip);
        print(deposits.length);
        if (deposits.isEmpty) {
          emit(DepositEndOfPageState(deposits: current));
        } else {
          current.addAll(deposits);
          emit(LoadedDepositState(deposits: current));
        }
      } catch (e) {
        emit(ErrorDepositState(error: e.toString()));
      }
    });

    //  logic of create deposit state
    on<CreateDepositEvent>((event, emit) async {
      emit(LoadingDepositState());
      try {} catch (e) {
        emit(ErrorDepositState(error: e.toString()));
      }
    });

    //  logic of update deposit state
    on<UpdateDepositEvent>((event, emit) async {
      emit(LoadingDepositState());
      try {} catch (e) {
        emit(ErrorDepositState(error: e.toString()));
      }
    });

    //  logic of delete deposit state
    on<DeleteDepositEvent>((event, emit) async {
      emit(LoadingDepositState());
      try {} catch (e) {
        emit(ErrorDepositState(error: e.toString()));
      }
    });
  }
}
