class User {
  String? name, email, password, mobileNumber, userAvatar;
  List<Map>? address;

  User(
      {required this.address,
      required this.userAvatar,
      required this.email,
      required this.password,
      required this.mobileNumber,
      required this.name});

  factory User.fromJson(Map json) {
    return User(
      email: json["email"],
      password: json["password"],
      mobileNumber: json["mobileNumber"],
      name: json["name"],
      userAvatar: json["userAvatar"],
      address: [json["address"]],
    );
  }
}
