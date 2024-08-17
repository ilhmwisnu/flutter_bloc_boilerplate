import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_boilerplate/core/data_state.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/domain/usecase/get_user_by_id.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/presentation/cubit/user_detail_state.dart';

import '../../../../core/base_state.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  UserDetailCubit(this._getUserById, {required this.id})
      : super(UserDetailState()) {
    loadData(status: Status.initial);
  }

  final int id;
  final GetUserById _getUserById;

  void loadData({Status status = Status.initial}) async {
    emit(UserDetailState(status: status));
    final userData = await _getUserById(id);

    if (userData is DataFailure) {
      emit(UserDetailState(
          status: Status.failure, errorMessage: userData.errorMessage));
      return;
    }

    emit(UserDetailState(
      status: Status.success,
      data: userData.data,
    ));
  }

  void refresh() {
    loadData(status: Status.loading);
  }
}
