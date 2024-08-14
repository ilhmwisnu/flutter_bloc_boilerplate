import 'package:flutter_bloc_boilerplate/features/dashboard/domain/entity/user.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/domain/repository/user_repository.dart';
import 'package:flutter_bloc_boilerplate/core/pagination.dart';

import '../../../../core/data_state.dart';

class GetAllUser {
  final UserRepository _userRepository;

  GetAllUser({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<DataState<Pagination<User>>> call() async {
    return _userRepository.getUsers();
  }
}
