import 'package:ekub_app/features/user/bloc/index.dart';
import 'package:ekub_app/features/user/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc(unUserState, {required this.userRepository})
      : super(const UnUserState()) {
    //fetch all User
    on<FetchUserEvent>((event, emit) async {
      emit(const LoadingUserState());
      try {
        final result = await userRepository.getUser(event.take, event.skip);
        emit(InUserState(users: result));
      } catch (e) {
        emit(ErrorUserState(e.toString()));
      }
    });

    //add new User
    on<AddUserEvent>((event, emit) async {
      emit(const LoadingUserState());
      try {
        final result = await userRepository.createUser(event.user);
        emit(SucessState(message: result['message']));
      } catch (e) {
        emit(ErrorUserState(e.toString()));
      }
    });

    //update new User
    on<UpdateUserEvent>((event, emit) async {
      emit(const LoadingUserState());
      try {
        final result =
            await userRepository.updateUser(event.user, event.user.id);
        emit(SucessState(message: result['message']));
      } catch (e) {
        emit(ErrorUserState(e.toString()));
      }
    });

    // delete new User
    on<DeleteUserEvent>((event, emit) async {
      emit(const LoadingUserState());
      try {
        final result = await userRepository.deactivateUser(event.id);
        emit(SucessState(message: result['message']));
      } catch (e) {
        emit(ErrorUserState(e.toString()));
      }
    });
  }
}
