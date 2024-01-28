import 'dart:convert';

List<Contribution> contributionFromJson(String str) => List<Contribution>.from(
    json.decode(str).map((x) => Contribution.fromJson(x)));

String contributionToJson(List<Contribution> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contribution {
  final int id;
  final String created_at;
  final String updated_at;

  final String email;
  final double contribution;

  Contribution(
      {required this.id,
      required this.created_at,
      required this.updated_at,
      required this.email,
      required this.contribution});

  factory Contribution.fromJson(Map<String, dynamic> json) {
    return Contribution(
        id: json['id'],
        created_at: json['created_at'],
        updated_at: json['updated_at'],
        email: json['email'],
        contribution: json['contribution']
        );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": created_at,
        "updated_at": updated_at,
        "email": email,
        "contribution":contribution
        
      };
}
