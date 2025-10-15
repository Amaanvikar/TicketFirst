class User {
  int id;
  String name;
  String email;
  String body;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      body: json["body"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "body": body};
  }

  //   @override
  // String toString() {
  //   return 'User(id: $id, name: $name, email: $email, body: $body)';
  // }
}
