import 'dart:convert';
import 'package:fabb_mobil/app/models/incident_model.dart';
import 'package:http/http.dart' as http;

class IncidentService {
  Future<void> GetIncidentData(String incidentId) async {
    const baseUrl = 'https://192.168.1.106:5111';
    final response =
        await http.get(Uri.parse('$baseUrl/incidents/$incidentId'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
    } else {
      throw Exception(
          'Failed to load user data from API: ${response.statusCode}');
    }
  }

  Future<bool> postIncident(Incident incident) async {
    String postUrl = "https://192.168.1.106:5111/incident";
    Map<String, String> headers = {
      "Content-Type": "applicaiton/json",
      "Accept": "application/json"
    };
    final Map<String, dynamic> incidentJson = {};

    print(jsonEncode(incidentJson));
    http.Response response = await http.post(Uri.parse(postUrl),
        headers: headers, body: jsonEncode(incidentJson));
    if (response.statusCode == 200) {
      // Success
      print("Data Posted Successfully!");
      return true;
    } else {
      // Failure
      print("Failed to Post Data. Error: ${response.statusCode}");
      return false;
    }
  }
}
