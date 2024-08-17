import 'package:flutter_bloc_boilerplate/features/dashboard/domain/entity/user.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/domain/repository/user_repository.dart';
import '../../../../core/data_state.dart';

class GetUserById {
  final UserRepository _userRepository;

  GetUserById({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<DataState<User>> call(int id) async {
    return _userRepository.getUserById(id);
  }
}
