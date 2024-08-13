// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:ekub_app/features/category/bloc/index.dart';
import 'package:ekub_app/features/category/repository/category_repository.dart';
import 'package:ekub_app/utils/exception%20function.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;
  CategoryBloc(unCategoryState, {required this.categoryRepository})
      : super(const UnCategoryState()) {
    //fetch all category
    on<FetchCategoryEvent>((event, emit) async {
      emit(const LoadingCategoryState());
      try {
        final result =
            await categoryRepository.getCategory(event.take, event.skip);
        emit(InCategoryState(categorys: result));
      } catch (e) {
        emit(ErrorCategoryState(e.toString()));
      }
    });

    //add new category
    on<AddCategoryEvent>((event, emit) async {
      emit(const LoadingCategoryState());
      try {
        final result = await categoryRepository.createCategory(event.category);
        emit(SucessCategoryState(message: result['message']));
      } catch (e) {
        emit(ErrorCategoryState(extractErrorMessage(e.toString())));
      }
    });

    //update new category
    on<UpdateCategoryEvent>((event, emit) async {
      emit(const LoadingCategoryState());
      try {
        final result = await categoryRepository.updateCategory(
            event.category, event.category.id);
        emit(SucessCategoryState(message: result['message']));
      } catch (e) {
        emit(ErrorCategoryState(e.toString()));
      }
    });

    // delete new category
    on<DeleteCategoryEvent>((event, emit) async {
      emit(const LoadingCategoryState());
      try {
        final result = await categoryRepository.deleteCategory(event.id);
        emit(SucessCategoryState(message: result['message']));
      } catch (e) {
        emit(ErrorCategoryState(e.toString()));
      }
    });
  }
}
