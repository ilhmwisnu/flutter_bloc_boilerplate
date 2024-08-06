import '../entity/auth.dart';

abstract class AuthRepository {
  Future<String> login({required String email, required String password});
  Future<Profile> getProfile();
}
