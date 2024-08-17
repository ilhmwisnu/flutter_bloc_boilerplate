import 'package:flutter_bloc_boilerplate/features/dashboard/domain/entity/user.dart';
import 'package:flutter_bloc_boilerplate/core/data_state.dart';
import 'package:flutter_bloc_boilerplate/core/pagination.dart';

abstract class UserRepository {
  Future<DataState<Pagination<User>>> getUsers();

  Future<DataState<User>> getUserById(int id);

}
