import 'package:dio/dio.dart';
import 'package:flutter_bloc_boilerplate/features/auth/data/dto/profile_dto.dart';
import 'package:flutter_bloc_boilerplate/utils/dio.dart';

class AuthApi {
  final Dio _client = restClient;

  Future<String> login(
      {required String email, required String password}) async {
    try {
      final res = await _client
          .post("/login", data: {"email": email, "password": password});
      return res.data["token"];
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<ProfileDto> getProfile() async {
    try {
      final res = await _client.get("/profile");

      return ProfileDto.fromJson(res.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
