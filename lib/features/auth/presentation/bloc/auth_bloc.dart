import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/features/auth/domain/entity/auth.dart';
import 'package:flutter_bloc_boilerplate/features/auth/domain/usecase/get_profile.dart';
import 'package:flutter_bloc_boilerplate/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_bloc_boilerplate/features/auth/presentation/bloc/auth_state.dart';

import '../../domain/usecase/login.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.login, this.getProfile) : super(AuthInitial()) {
    on<AuthLogin>(_onLogin);

    on<AuthLogout>(_onLogout);
  }

  final Login login;
  final GetProfile getProfile;

  Future<void> _onLogin(AuthLogin event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      final token = await login(email: event.email, password: event.password);

      // TODO: save token locally

      debugPrint(token);

      final Profile profileData = await getProfile();

      // TODO: save profile data

      emit(Authenticated(profile: profileData));
    } on Exception catch (e) {
      emit(LoginFailed(e));
    }
  }

  void _onLogout(AuthLogout event, Emitter<AuthState> emit) {
    // TODO: delete token and profile data
    print(event);
    emit(Unauthenticated());
  }
}
