import 'package:dio/dio.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/data/source/remote/user_api.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/domain/entity/user.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/domain/repository/user_repository.dart';
import 'package:flutter_bloc_boilerplate/core/pagination.dart';

import '../../../core/data_state.dart';

class UserRepositoryImpl extends UserRepository {
  final UserApi _userApi;

  UserRepositoryImpl({required UserApi userApi}) : _userApi = userApi;

  @override
  Future<DataState<Pagination<User>>> getUsers() async {
    try {
      final usersData = await _userApi.getUsers();

      return DataSuccess(data: usersData);
    } on DioException catch (e) {
      return DataFailure(errorMessage: e.response?.data["message"] ?? e.message );
    } catch (e) {
      return DataFailure(errorMessage: e.toString());
    }
  }
  
  @override
  Future<DataState<User>> getUserById(int id) async {
   try {
      final userData = await _userApi.getUserById(id);

      return DataSuccess(data: userData);
    } on DioException catch (e) {
      return DataFailure(errorMessage: e.response?.data["message"] ?? e.message );
    } catch (e) {
      return DataFailure(errorMessage: e.toString());
    }
  }
}
