import 'package:flutter_bloc_boilerplate/features/auth/domain/entity/auth.dart';

sealed class AuthState {
  final bool isObscureText;

  AuthState({this.isObscureText = true});
}

class AuthInitial extends AuthState {
  AuthInitial({bool? isObscureText}) : super(isObscureText: isObscureText ?? true );
}

class Unauthenticated extends AuthState {
  Unauthenticated({bool? isObscureText}) : super(isObscureText: isObscureText ?? true );
}

class LoginFailed extends AuthState {
  final String errorMessage;

  LoginFailed(this.errorMessage, {bool? isObscureText}) : super(isObscureText: isObscureText ?? true );
}

class Authenticated extends AuthState {
  Authenticated({required this.profile, bool? isObscureText}) : super(isObscureText: isObscureText ?? true );

  final Profile profile;
}

class AuthLoading extends AuthState {
  AuthLoading({bool? isObscureText}) : super(isObscureText: isObscureText ?? true );

}
