import "package:flutter/material.dart";
import "dart:convert";

class User {
  String name;
  String email;
  String phone;

  User({required this.name, required this.email, required this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], email: json['email'], phone: json['phone']);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "phone": phone};
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

// Future<void> fetchUsers() async {
//   final response = await http.get(Uri.parse('API url'));
//   try {
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//     } else {
//       print("Failed to load user's data");
//     }
//   } catch (e) {
//     print("exception: $e");
//   }
// }

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search  User")),
      body: Center(child: Text("Search Screen ")),
    );
  }
}
