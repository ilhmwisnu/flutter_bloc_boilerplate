import 'package:flutter_bloc_boilerplate/features/auth/domain/entity/auth.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class Unauthenticated extends AuthState {}

class LoginFailed extends AuthState {
  final Exception error;

  LoginFailed(this.error);
}

class Authenticated extends AuthState {
  Authenticated({required this.profile});

  final Profile profile;
}

class AuthLoading extends AuthState {}
