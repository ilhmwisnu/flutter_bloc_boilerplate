import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/routes/routes_config.dart';
import 'package:flutter_bloc_boilerplate/theme/theme.dart';

import 'features/auth/data/auth_repository_impl.dart';
import 'features/auth/data/source/remote/auth_api.dart';
import 'features/auth/domain/usecase/get_profile.dart';
import 'features/auth/domain/usecase/login.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        Login(AuthRepositoryImpl(authApi: AuthApi())),
        GetProfile(AuthRepositoryImpl(authApi: AuthApi())),
      ),
      child: Builder(builder: (context) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Unauthenticated) {
              routerConfig.go("/login");
            }
          },
          child: MaterialApp.router(
            routerConfig: routerConfig,
            theme: themeConfig,
            debugShowCheckedModeBanner: false,
          ),
        );
      }),
    );
  }
}
