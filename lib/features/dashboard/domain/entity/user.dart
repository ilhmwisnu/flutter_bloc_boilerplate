// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

class User {
    final int? id;
    final String? name;
    final String? email;
    final String? avatar;

    User({
        this.id,
        this.name,
        this.email,
        this.avatar,
    });
}
