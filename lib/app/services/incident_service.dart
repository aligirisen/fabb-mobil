import 'dart:convert';
import 'package:fabb_mobil/app/models/incident_model.dart';
import 'package:http/http.dart' as http;

class IncidentService {
  final baseUrl = 'https://192.168.1.106:5111';

  Future<void> fetchUserData(String incidentId) async {
    final response = await http.get(Uri.parse('$baseUrl/incident/$incidentId'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
    } else {
      throw Exception('Failed to load user data from API');
    }
  }

  Future<bool> postIncident(Incident incident) async {
    final Map<String, dynamic> incidentJson = {
      'user_id': incident.userid,
      'incident_id': incident.incidentid,
      'title': incident.title,
      'category': incident.category
    };

    print(jsonEncode(incidentJson));
    http.Response response =
        await http.post(Uri.parse(baseUrl), body: incidentJson);
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
