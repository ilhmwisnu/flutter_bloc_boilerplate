sealed class AuthEvent {}

class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  AuthLogin({required this.email, required this.password});
}

class AuthLogout extends AuthEvent {}
