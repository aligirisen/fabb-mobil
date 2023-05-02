import 'dart:convert';
import 'package:fabb_mobil/app/models/incident_model.dart';
import 'package:fabb_mobil/app/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class IncidentService {
  Future<void> getIncidentbyId(Incident incident) async {
    String incidentGetId = incident.incidentId;
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

  Future<bool> postIncident(Incident incident) async {
    final Map<String, dynamic> incidentJson = {
      'user_id': incident.userid,
      'incident_id': incident.incidentid,
      'title': incident.title,
      'category': incident.category,
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
  } /*

  Future<List<Incident>> getIncident() async {
    final response = await http.get(Uri.parse('$baseUrl/incident'));

    if (response.statusCode == 200) {
      final incidents = json.decode(response.body);
      return incidents;
    } else {
      throw Exception('Failed to load user data from API');
    }
  }*/

  List<Incident> incidents = [];
/*
  void fetchIncidents() async {
    final List<Incident> fetchedIncidents = await getIncidents();
    setState(() {
      incidents = fetchedIncidents;
    });
  }

  Future<List<Incident>> getIncidents() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/incidents'));
    if (response.statusCode == 200) {
      final incidentJson = json.decode(response.body);
      final List<Incident> incidents = List<Incident>.from(
          incidentJson.map((incident) => fromJson(incident)));
      return incidents;
    } else {
      throw Exception('Failed to load incidents');
    }
  }*/

  /*Future<bool> deleteIncident(String userId, String accountId) async {
    final Map<String, dynamic> userJson = {
      'user_id': userId,
      'account_id': accountId,
    };

    // Send the DELETE request
    http.Response response = await http
        .delete(Uri.parse('$baseUrl/user/delete'), body: jsonEncode(userJson));

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
  }*/

  /*Future<bool> updateIncident(Incident incident) async {
    final Map<String, dynamic> userJson = {
      'account_id': user.accountId,
      'user_id': user.userId,
      'date_of_birth': user.dateOfBirth,
      'full_name': user.fullName,
      'email': user.email,
      'password': user.password,
      'incidents': user.incident,
      'liked_incidents': user.likedIncidents,
      'disliked_incidents': user.dislikedIncidents,
      'location': user.location,
      'phone_number': user.phoneNumber,
      'user_type': null,
    };
    http.Response response = await http
        .put(Uri.parse('$baseUrl/incident/update'), body: jsonEncode(userJson));

    if (response.statusCode == 200) {
      // Success
      print("User deleted successfully");
      return true;
    } else {
      // Failure
      print("Failed to delete user. Error: ${response.statusCode}");
      return false;
    }
  }*/
}
