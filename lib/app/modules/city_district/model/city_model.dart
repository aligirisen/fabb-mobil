
class CityModel {
  CityModel({
    required this.id,
    required this.name,
    required this.plateCode,
  });
  late final int id;
  late final String name;
  late final String plateCode;

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    plateCode = json['plate_code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['plate_code'] = plateCode;
    return data;
  }
}
