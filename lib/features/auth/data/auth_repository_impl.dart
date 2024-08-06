import 'package:flutter_bloc_boilerplate/features/auth/data/source/remote/auth_api.dart';
import 'package:flutter_bloc_boilerplate/features/auth/domain/entity/auth.dart';
import 'package:flutter_bloc_boilerplate/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required authApi}) : _authApi = authApi;

  final AuthApi _authApi;

  @override
  Future<Profile> getProfile() {
    return _authApi.getProfile();
  }

  @override
  Future<String> login(
      {required String email, required String password}) async {
    return await _authApi.login(email: email, password: password);
  }
}
