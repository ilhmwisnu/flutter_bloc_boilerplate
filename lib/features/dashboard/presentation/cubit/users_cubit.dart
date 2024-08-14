import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/domain/usecase/get_all_user.dart';
import 'package:flutter_bloc_boilerplate/core/data_state.dart';

import '../../../../core/base_state.dart';
import 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._getAllUser) : super(UsersState()) {
    loadData(status: Status.initial);
  }

  final GetAllUser _getAllUser;

  void loadData({int page = 1, Status status = Status.initial}) async {
    emit(UsersState(status: status));
    final userData = await _getAllUser();

    if (userData is DataFailure) {
      emit(UsersState(
          status: Status.failure, errorMessage: userData.errorMessage));
      return;
    }

    emit(UsersState(
      status: Status.success,
      data: userData.data!.data,
      page: userData.data!.page,
      totalPage: userData.data!.totalPage,
    ));
  }

  void refresh() {
    loadData(page: 1, status: Status.loading);
  }

  void nextPage() {
    if (state.isLastPage) return;

    loadData(page: state.page + 1, status: Status.loading);
  }
}
