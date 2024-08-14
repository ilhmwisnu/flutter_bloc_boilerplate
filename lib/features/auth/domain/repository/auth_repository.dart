import 'package:flutter_bloc_boilerplate/core/data_state.dart';

import '../entity/auth.dart';

abstract class AuthRepository {
  Future<DataState<String>> login({required String email, required String password});
  Future<DataState<Profile>> getProfile();
}
