
import 'package:flutter_bloc_boilerplate/features/dashboard/domain/entity/user.dart';

class UserDto extends User {

    UserDto({
        super.id,
        super.name,
        super.email,
        super.avatar,
    });

    factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "avatar": avatar,
    };
}
