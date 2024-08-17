import 'package:flutter_bloc_boilerplate/features/dashboard/domain/entity/user.dart';
import 'package:flutter_bloc_boilerplate/core/base_state.dart';

class UserDetailState extends BaseState<User> {
  UserDetailState({
    super.data,
    super.errorMessage,
    super.status = Status.initial,
  });
}
