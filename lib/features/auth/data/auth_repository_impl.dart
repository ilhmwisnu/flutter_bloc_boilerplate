import 'package:dio/dio.dart';
import 'package:flutter_bloc_boilerplate/features/auth/data/source/remote/auth_api.dart';
import 'package:flutter_bloc_boilerplate/features/auth/domain/entity/auth.dart';
import 'package:flutter_bloc_boilerplate/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc_boilerplate/utils/data_state.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required authApi}) : _authApi = authApi;

  final AuthApi _authApi;

  @override
  Future<DataState<Profile>> getProfile() async {
    try {
      Profile profileData = await _authApi.getProfile();

      return DataSuccess(data: profileData);
    } on DioException catch (e) {
      return DataFailure(
          errorMessage: e.response?.data["message"] ?? e.message);
    } catch (e) {
      return DataFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<DataState<String>> login(
      {required String email, required String password}) async {
    try {
      final data = await _authApi.login(email: email, password: password);

      return DataSuccess(data: data);
    } on DioException catch (e) {
      return DataFailure(
          errorMessage: e.response?.data["message"] ?? e.message);
    } catch (e) {
      return DataFailure(errorMessage: e.toString());
    }
  }
}
