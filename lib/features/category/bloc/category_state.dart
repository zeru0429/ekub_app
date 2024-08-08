import 'package:ekub_app/features/category/model/category_model.dart';
import 'package:equatable/equatable.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnCategoryState extends CategoryState {
  const UnCategoryState();

  @override
  String toString() => 'UnCategoryState';
}

/// Initialized
class InCategoryState extends CategoryState {
  const InCategoryState({required this.categorys});

  final List<CategoryModel> categorys;

  @override
  String toString() => 'InCategoryState';

  @override
  List<Object> get props => [categorys];
}

// Error state
class ErrorCategoryState extends CategoryState {
  const ErrorCategoryState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorCategoryState';

  @override
  List<Object> get props => [errorMessage];
}

// Loading state
class LoadingCategoryState extends CategoryState {
  const LoadingCategoryState();

  @override
  String toString() => 'LoadingCategoryState';

  @override
  List<Object> get props => [];
}

// message state
class SucessState extends CategoryState {
  const SucessState({required this.message});
  final String message;

  @override
  String toString() => 'Sucess Category State';

  @override
  List<Object> get props => [];
}
