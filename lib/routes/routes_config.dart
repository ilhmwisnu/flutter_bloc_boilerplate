import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/features/auth/presentation/view/login_page.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/data/source/remote/user_api.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/data/user_repository_impl.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/domain/usecase/get_all_user.dart';
import 'package:go_router/go_router.dart';

import '../features/dashboard/presentation/view/dashboard_page.dart';
import '../features/dashboard/presentation/cubit/users_cubit.dart';
import '../features/dashboard/presentation/view/user_detail_page.dart';

final routerConfig = GoRouter(
  initialLocation: "/login",
  routes: [
    GoRoute(
      path: "/login",
      builder: (context, state) => LoginPage()
    ),
    GoRoute(
      path: "/dashboard",
      builder: (context, state) => BlocProvider(
        create: (context) => UsersCubit(GetAllUser(userRepository: UserRepositoryImpl(userApi: UserApi()))),
        child: DashboardPage(),
      ),
    ),
    GoRoute(
      path: "/users/:id",
      builder: (context, state) =>
          UserDetailPage(id: state.pathParameters['id']!),
    ),
  ],
);
