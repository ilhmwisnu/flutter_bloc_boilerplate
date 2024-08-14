import 'package:dio/dio.dart';
import 'package:flutter_bloc_boilerplate/features/auth/data/dto/profile_dto.dart';
import 'package:flutter_bloc_boilerplate/core/dio.dart';

class AuthApi {
  final Dio _client = restClient;

  Future<String> login(
      {required String email, required String password}) async {
    final res = await _client
        .post("/login", data: {"email": email, "password": password});
    return res.data["token"];
  }

  Future<ProfileDto> getProfile() async {
    final res = await _client.get("/profile");

    return ProfileDto.fromJson(res.data);
  }
}
