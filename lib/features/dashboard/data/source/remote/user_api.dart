import 'package:dio/dio.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/data/dto/user_dto.dart';
import 'package:flutter_bloc_boilerplate/core/dio.dart';
import 'package:flutter_bloc_boilerplate/core/pagination.dart';

class UserApi {
  final Dio _client = restClient;

  Future<Pagination<UserDto>> getUsers() async {
    final res = await _client.get("/users");

    List userData = res.data["data"];

    List<UserDto> users = userData.map((e) => UserDto.fromJson(e)).toList();

    Pagination<UserDto> pagination = Pagination<UserDto>(
      data: users,
      page: res.data["page"],
      limit: res.data["limit"],
      total: res.data["total"],
      totalPage: res.data["total_page"],
    );

    return pagination;
  }

  Future<UserDto> getUserById(int id) async {
    final res = await _client.get("/users/${id}");

    return UserDto.fromJson(res.data["data"]);
  }
}
