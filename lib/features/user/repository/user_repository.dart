import 'package:ekub_app/features/user/model/user_model.dart';
import 'package:ekub_app/features/user/provider/user_provider.dart';

class UserRepository {
  UserProvider userProvider;
  UserRepository({required this.userProvider});

  //get all list of User
  Future<List<UserModel>> getUser(int take, int skip) async {
    final response = await userProvider.getAllUsers(skip, take);
    return response['success']
        ? (response['data'] as List<dynamic>)
            .map((i) => UserModel.fromJson(i))
            .toList()
        : throw Exception();
  }

  //get single User detail
  Future<UserModel?> getSingleUserDetail(int id) async {
    final response = await userProvider.getSingleUser(id);
    return response["success"]
        ? UserModel.fromJson(response['data'])
        : throw Exception();
  }

  // create new User
  Future<Map<String, dynamic>> createUser(UserModel User) async {
    final response = await userProvider.addUser(User.toJson());
    return response;
  }

  // update new User
  Future<Map<String, dynamic>> updateUser(UserModel User, int id) async {
    final response = await userProvider.updateUserProfile(User.toJson(), id);
    return response;
  }

  // delete new User
  Future<Map<String, dynamic>> deactivateUser(int id) async {
    final response = await userProvider.deactivateUser(id);
    return response;
  }
}
