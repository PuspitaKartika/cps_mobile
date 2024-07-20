class UserModel {
  String name;
  String address;
  String email;
  String phoneNumber;
  String city;
  String id;
  String? query;

  UserModel({
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.city,
    required this.id,
    this.query,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: (json["name"] as String?)?.isNotEmpty == true
          ? json["name"] as String
          : 'No Name',
      address: (json["address"] as String?)?.isNotEmpty == true
          ? json["address"] as String
          : 'No Address',
      email: (json["email"] as String?)?.isNotEmpty == true
          ? json["email"] as String
          : 'No Email',
      phoneNumber: (json["phoneNumber"] as String?)?.isNotEmpty == true
          ? json["phoneNumber"] as String
          : 'No Phone Number',
      city: (json["city"] as String?)?.isNotEmpty == true
          ? json["city"] as String
          : 'No City',
      id: (json["id"] as String?)?.isNotEmpty == true
          ? json["id"] as String
          : 'No ID',
      query: json["query"] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "email": email,
        "phoneNumber": phoneNumber,
        "city": city,
        "id": id,
        "query": query,
      };
}
