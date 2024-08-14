import 'package:flutter_bloc_boilerplate/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc_boilerplate/core/data_state.dart';

class Login {
  Login(this.repository);
  final AuthRepository repository;

  Future<DataState<String>> call({required String email, required String password}) async {
    return await repository.login(email: email, password: password);
  }
}


