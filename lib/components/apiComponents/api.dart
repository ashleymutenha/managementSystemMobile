import 'dart:convert';
// import 'dart:html';

import 'package:food/components/apiComponents/member.dart';
import 'package:food/components/apiComponents/contribution.dart';
import 'package:http/http.dart' as http;

class CallApi {
  Future<List<Member>?> getMembers() async {
    var client = http.Client();

    var uri = Uri.parse(
        "https://managementsystembackend-production.up.railway.app/allMembers");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return memberFromJson(json);
    } else {
      throw Exception("Failed to Load Member Info");
    }
  }

  registerUser({required Map<String, String> data}) async {
    String body = jsonEncode(data);
    final uri = Uri.parse(
        "https://managementsystembackend-production.up.railway.app/api/mobileUserRegister");
    var response = await http.post(
      Uri.parse(
          "https://managementsystembackend-production.up.railway.app/api/mobileUserRegister"),
      body: jsonEncode(data),
      headers: {
        "Content-Type": "Application/json",
        "Accept": "Application/json"
      },
    );

    return response.statusCode;
  }

  Future<List<Contribution>?> getContributions(String username) async {
    var client = http.Client();

    var uri = Uri.parse(
        "https://managementsystembackend-production.up.railway.app/contributions/$username");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return contributionFromJson(json);
    } else {
      throw Exception("Failed to Load Contributions Info");
    }
  }
}
