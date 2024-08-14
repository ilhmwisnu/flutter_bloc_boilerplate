import 'package:flutter_bloc_boilerplate/features/dashboard/domain/entity/user.dart';
import 'package:flutter_bloc_boilerplate/core/base_state.dart';

class UsersState extends BaseListState<User> {
  UsersState({
    super.page = 1,
    super.data = const [],
    super.errorMessage,
    super.status = Status.initial,
    super.totalPage,
  });
}
