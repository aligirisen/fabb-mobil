import 'dart:convert';
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

  Future<bool> postIncident(IncidentModel incident) async {
    final Map<String, dynamic> incidentJson = {
      'user_id': incident.userId,
      'incident_id': incident.incidentId,
      'title': incident.title,
      'category': incident.category,
      'location': incident.location,
      'key': incident.key,
      'attachments': incident.attachments,
      'address': incident.address,
      'create_date': incident.createDate,
      'incident_status': incident.incidentStatus,
      'report_number': incident.reportNumber,
      'description': incident.description,
      'upvote_count': incident.upvoteCount,
      'downvote_count': incident.downvoteCount
    };

    var encodedIncident = jsonEncode(incidentJson);
    http.Response response = await http
        .post(Uri.parse('$baseUrl/incident/create'), body: encodedIncident);
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

  Future<List<IncidentModel>> getIncidents() async {
    http.Response response = await http.get(Uri.parse('$baseUrl/incident/'));

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
