import 'dart:convert';
import 'dart:io';
import 'package:fabb_mobil/app/models/incident_model.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class IncidentService {
  Future<void> getIncidentbyId(IncidentModel incident) async {
    String? incidentGetId = incident.incidentId;
    Map<String, dynamic> incidentJson;
    final response =
        await http.get(Uri.parse('$baseUrl/incident/$incidentGetId'));
    if (response.statusCode == 200) {
      incidentJson = json.decode(response.body);
      print(incidentJson['category']);
    } else {
      throw Exception('Failed to load user data from API');
    }
  }

  Future<bool> postIncident(IncidentModel incident, File image) async {
    /*String incidentJson = incidentModelToJson(incident);
    http.Response response = await http.post(
      Uri.parse('$baseUrl/incident/create'),
      headers: {'Content-Type': 'application/json'},
      body: incidentJson,
    );*/

    var request =
        http.MultipartRequest("POST", Uri.parse('$baseUrl/incident/create'));

    request.fields.addAll(incident.toJson());

    request.files.add(await http.MultipartFile.fromPath(
      'attachments',
      image.path,
    ));
    print(incident.toJson());
    request.send();
    print("request sending");
    return true;
    /*if (response.statusCode == 200) {
      // Success
      print("Data Posted Successfully!");
      
    } else {
      // Failure
      print("Failed to Post Data. Error: ${response.statusCode}");
      return false;
    }*/
  }

  /* void postImageAndObjectToBackend(
      File imageFile, IncidentModel incident) async {
    // Backend URL'sini ve endpoint'i buraya yazın

    // Resmi base64 formatına dönüştürme
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);

    // Nesneyi JSON formatına dönüştürme
    Map<String, dynamic> incidentJson = incident.toJson();
    String objectJsonString = jsonEncode(incidentJson);

    // HTTP POST isteği oluşturma
    var requestBody = {
      'image': base64Image,
      'object': objectJsonString,
    };

    var response = await http.post(Uri.parse(baseUrl), body: requestBody);

    if (response.statusCode == 200) {
      print("Data Posted Successfully!");
    } else {
      print("Failed to Post Data. Error: ${response.statusCode}");
    }
  }*/
/*
  Future<bool> postIncident(IncidentModel incident, File image) async {
    // Read image bytes
    List<int> imageBytes = await image.readAsBytes();
    String base64Image = base64Encode(imageBytes);

    // Create the incident JSON
    Map<String, dynamic> incidentData = incident.toJson();
    incidentData['attachments'] = {'image': base64Image};
    String incidentJson = jsonEncode(incidentData);

    // Send the POST request
    http.Response response = await http.post(
      Uri.parse('$baseUrl/incident/create'),
      headers: {'Content-Type': 'application/json'},
      body: incidentJson,
    );

    if (response.statusCode == 200) {
      // Success
      print("Data Posted Successfully!");
      return true;
    } else {
      // Failure
      print("Failed to Post Data. Error: ${response.statusCode}");
      return false;
    }
  }*/

  Future<List<IncidentModel>> getIncidents() async {
    http.Response response = await http
        .get(Uri.parse('$baseUrl/incident/'))
        .timeout(const Duration(seconds: 1));
    if (response != null) {
      Map<String, dynamic> value = json.decode(response.body);
      List<IncidentModel> list = [];

      if (response.statusCode == 200) {
        value.forEach((key, value) {
          list.add(IncidentModel.fromJson(value));
        });

        return list;
      } else {
        throw Exception('Failed to load incidents');
      }
    }
    throw Exception('Unexpected error');
  }

  Future<bool> deleteIncident(String incidentId) async {
    // Send the DELETE request
    http.Response response =
        await http.delete(Uri.parse('$baseUrl/incident/$incidentId'));

    // Handle the response
    if (response.statusCode == 200) {
      // Success
      print("User deleted successfully");
      return true;
    } else {
      // Failure
      print("Failed to delete user. Error: ${response.statusCode}");
      return false;
    }
  }
}
