import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/domain/usecase/get_all_user.dart';

import '../../../../../utils/base_state.dart';
import 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._getAllUser) : super(UsersState()) {
    loadData(status: Status.initial);
  }

  final GetAllUser _getAllUser;

  void loadData({int page = 1, Status status = Status.initial}) async {
    emit(UsersState(status: status));
    try {
      final userData = await _getAllUser();
      emit(UsersState(
        status: Status.success,
        data: userData.data,
        page: userData.page,
        totalPage: userData.totalPage,
      ));
    } catch (e) {
      print(e);
      emit(UsersState(
        status: Status.failure,
        data: state.data,
        page: page,
        error: e as Exception,
        totalPage: state.totalPage,
      ));
    }
  }

  void refresh() {
    loadData(page: 1, status: Status.loading);
  }

  void nextPage() {
    if (state.isLastPage) return;

    loadData(page: state.page + 1, status: Status.loading);
  }
}
