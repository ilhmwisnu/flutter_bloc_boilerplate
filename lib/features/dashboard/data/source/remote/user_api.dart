import 'package:dio/dio.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/data/dto/user_dto.dart';
import 'package:flutter_bloc_boilerplate/utils/dio.dart';
import 'package:flutter_bloc_boilerplate/utils/pagination.dart';

class UserApi {
  final Dio _client = restClient;

  Future<Pagination<UserDto>> getUsers() async {
    try {
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
    } catch (e) {
      rethrow;
    }
  }
}
