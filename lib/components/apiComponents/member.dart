import 'dart:convert';

List<Member> memberFromJson(String str) =>
    List<Member>.from(json.decode(str).map((x) => Member.fromJson(x)));

String memberToJson(List<Member> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Member {
  final int id;
  final String created_at;
  final String updated_at;
  final String name;
  final String phone;
  final String email;
  final String password;

  Member({
    required this.id,
    required this.created_at,
    required this.updated_at,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        id: json['id'] as int ,
        created_at: json['created_at'] as String ,
        updated_at: json['updated_at'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        phone: json['phone'] as String);
  }

   factory Member.fromJson2(Map<String, dynamic> json) {
    return Member(
        id: json['id'] as int  ,
        created_at: json['created_at'] as String ,
        updated_at: json['updated_at'] as String ,
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        phone: json['phone'] as String);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": created_at,
        "updated_at": updated_at,
        "name": name,
        "email": email,
        "password": password,
        "phone":phone,
      };
}
