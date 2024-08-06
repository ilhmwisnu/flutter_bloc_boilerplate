
import 'package:flutter_bloc_boilerplate/features/auth/domain/entity/auth.dart';

class ProfileDto extends Profile{
  

    ProfileDto({
        super.id,
        super.name,
        super.email,
        super.avatar,
    });

    factory ProfileDto.fromJson(Map<String, dynamic> json) => ProfileDto(
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
