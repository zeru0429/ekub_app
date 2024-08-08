// ignore_for_file: depend_on_referenced_packages

import 'package:ekub_app/features/category/model/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

@immutable
sealed class CategoryEvent {}

class UnCategoryEvent extends CategoryEvent {}

class FetchCategoryEvent extends CategoryEvent {
  final int skip, take;
  FetchCategoryEvent({required this.take, required this.skip});
}

class FetchSingleCategoryEvent extends CategoryEvent {
  final int id;
  FetchSingleCategoryEvent({required this.id});
}

class AddCategoryEvent extends CategoryEvent {
  final CategoryModel category;
  AddCategoryEvent({required this.category});
}

class UpdateCategoryEvent extends CategoryEvent {
  final CategoryModel category;
  UpdateCategoryEvent({required this.category});
}

class DeleteCategoryEvent extends CategoryEvent {
  final int id;
  DeleteCategoryEvent({required this.id});
}
