import 'package:flutter_bloc_boilerplate/features/auth/domain/entity/auth.dart';
import 'package:flutter_bloc_boilerplate/features/auth/domain/repository/auth_repository.dart';

class GetProfile {
  GetProfile(this.repository);

  final AuthRepository repository;

  Future<Profile> call() async {
    return await repository.getProfile();
  }
}
