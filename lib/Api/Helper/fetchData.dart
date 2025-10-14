import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ticketfirst/Api/Model/dummyUserModel.dart';

class fetchUser {
  final apiUrl = "https://jsonplaceholder.typicode.com/posts/1/comments";

  Future<void> fetchUserData() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        final users = data.map((e) => User.fromJson(e)).toList();
        for (var user in users) {
          print('${user.id} | ${user.name} | ${user.email}');
        }
        print(users);
      } else {
        print("response failed with statusCode: ${response.statusCode}");
      }
    } catch (e) {
      print("another exception failed: $e");
    }
  }
}
