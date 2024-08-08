import 'package:ekub_app/features/category/model/category_model.dart';
import 'package:ekub_app/features/category/provider/category_provider.dart';

class CategoryRepository {
  CategoryProvider categoryProvider;
  CategoryRepository({required this.categoryProvider});

  //get all list of Category
  Future<List<CategoryModel>> getCategory(int take, int skip) async {
    final response = await categoryProvider.getAllCategory(skip, take);
    return response['success']
        ? (response['data'] as List<dynamic>)
            .map((i) => CategoryModel.fromJson(i))
            .toList()
        : throw Exception();
  }

  //get single Category detail
  Future<CategoryModel?> getSingleCategoryDetail(int id) async {
    final response = await categoryProvider.getSingleCategory(id);
    return response["success"]
        ? CategoryModel.fromJson(response['data'])
        : throw Exception();
  }

  // create new Category
  Future<Map<String, dynamic>> createCategory(CategoryModel category) async {
    final response = await categoryProvider.addCategory(category.toJson());
    return response;
  }

  // update new Category
  Future<Map<String, dynamic>> updateCategory(
      CategoryModel category, int id) async {
    final response =
        await categoryProvider.updateCategory(category.toJson(), id);
    return response;
  }

  // delete new Category
  Future<Map<String, dynamic>> deleteCategory(int id) async {
    final response = await categoryProvider.deleteCategory(id);
    return response;
  }
}
