import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/features/auth/domain/usecase/get_profile.dart';
import 'package:flutter_bloc_boilerplate/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_bloc_boilerplate/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc_boilerplate/core/data_state.dart';

import '../../domain/usecase/login.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.login, this.getProfile)
      : super(AuthInitial(isObscureText: true)) {
    on<AuthLogin>(_onLogin);
    on<AuthLogout>(_onLogout);
    on<AuthToggleObscureText>(_onToggleObscureText);
  }

  final Login login;
  final GetProfile getProfile;

  Future<void> _onLogin(AuthLogin event, Emitter<AuthState> emit) async {
    if (state is AuthLoading) return;

    emit(AuthLoading());

    final tokenData = await login(email: event.email, password: event.password);

    if (tokenData is DataFailure) {
      emit(LoginFailed(tokenData.errorMessage!));
      return;
    }

    // TODO: save token locally

    final profileData = await getProfile();

    if (profileData is DataFailure) {
      emit(LoginFailed(profileData.errorMessage!));
      return;
    }

    // TODO: save profile data

    emit(Authenticated(profile: profileData.data!));
  }

  void _onLogout(AuthLogout event, Emitter<AuthState> emit) {
    // TODO: delete token and profile data
    emit(Unauthenticated());
  }

  void _onToggleObscureText(
      AuthToggleObscureText event, Emitter<AuthState> emit) {
    emit(Unauthenticated(isObscureText: !(state.isObscureText)));
  }
}
