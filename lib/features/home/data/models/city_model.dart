class CityModel {
  String name;
  String id;

  CityModel({
    required this.name,
    required this.id,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(name: json["name"], id: json["id"]);
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
