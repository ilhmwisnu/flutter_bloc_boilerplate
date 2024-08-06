import 'package:flutter_bloc_boilerplate/features/dashboard/data/source/remote/user_api.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/domain/entity/user.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/domain/repository/user_repository.dart';
import 'package:flutter_bloc_boilerplate/utils/pagination.dart';

class UserRepositoryImpl extends UserRepository {
  final UserApi _userApi;

  UserRepositoryImpl({required UserApi userApi}) : _userApi = userApi;

  @override
  Future<Pagination<User>> getUsers() async {
    return await _userApi.getUsers();
  }
}
