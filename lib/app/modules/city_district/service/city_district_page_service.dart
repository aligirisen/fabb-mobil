import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/city_model.dart';
import '../model/district_model.dart';

class CityService {
  static var client = http.Client();

  static Future<List<CityModel>> fetchCities() async {
    var response = await client.get(Uri.parse(
        'https://staging-micro-api.servislet.com/api/v1/mobile/main/regions/cities'));

    if (response.statusCode == 200) {
      await Future.delayed(const Duration(seconds: 3), () {});
      Map<String, dynamic> values = json.decode(response.body);
      List<CityModel> cities = List<CityModel>.from(
          values["responseData"]["cities"].map((x) => CityModel.fromJson(x)));
      return cities;
    } else {
      print("error while reading city data");
      return [];
    }
  }
}

class DistrictService {
  static var client = http.Client();

  static Future<List<DistrictModel>> fetchDistricts(int cityId) async {
    var response = await client.get(Uri.parse(
        'https://staging-micro-api.servislet.com/api/v1/mobile/main/regions/districts?city_id=$cityId'));
    if (response.statusCode == 200) {
      Map<String, dynamic> values = json.decode(response.body);
      List<DistrictModel> districts = List<DistrictModel>.from(
          values["responseData"]["districts"]
              .map((x) => DistrictModel.fromJson(x)));
      return districts;
    } else {
      print("error while reading district data");
      return [];
    }
  }
}
