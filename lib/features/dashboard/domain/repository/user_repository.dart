import 'package:flutter_bloc_boilerplate/features/dashboard/domain/entity/user.dart';
import 'package:flutter_bloc_boilerplate/utils/pagination.dart';

abstract class UserRepository {
  Future<Pagination<User>> getUsers();
}
