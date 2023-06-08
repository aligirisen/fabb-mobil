import 'dart:convert';
import 'package:fabb_mobil/app/general_app_datas/general_app_datas.dart';

import '../../main.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<String> fetchUserData(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$userId'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      final accountId = jsonData['account_id'];
      return accountId;
    } else {
      throw Exception(
          'Failed to load user data from API: ${response.statusCode}');
    }
  }

  Future<void> getUserDatas(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$userId'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      GeneralAppDatas.birthDateSettings.value = jsonData['date_of_birth'];
      GeneralAppDatas.fullNameSettings.value = jsonData['full_name'];
      GeneralAppDatas.phoneNumberSettings.value = jsonData['phone_number'];
      GeneralAppDatas.userEmail.value = jsonData['email'];
      print(GeneralAppDatas.birthDateSettings);
    } else {
      throw Exception(
          'Failed to load user data from API: ${response.statusCode}');
    }
  }

  Future<bool> deleteUser(String userId, String accountId) async {
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
  }

  Future<bool> updateUser(User user) async {
    Map<String, dynamic> userJson = {
      'account_id': user.accountId,
      'user_id': user.userId,
      'date_of_birth': user.dateOfBirth,
      'full_name': user.fullName,
      'email': user.email,
      'phone_number': user.phoneNumber,
    };
    if (user.password != null && user.password!.isNotEmpty) {
      userJson['password'] = user.password;
    }

    final encodedUserJson = jsonEncode(userJson);
    print(encodedUserJson);
    http.Response response = await http.put(
      Uri.parse('$baseUrl/user/update'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: encodedUserJson,
    );

    if (response.statusCode == 200) {
      // Success
      print("User updated successfully");
      return true;
    } else {
      // Failure
      print("Failed to update user. Error: ${response.statusCode}");
      return false;
    }
  }
  /*
  Future<bool> updateUser(User user) async {
    final url = Uri.parse('$baseUrl/user/update');
    final request = http.MultipartRequest('PUT', url);

    // JSON verilerini form-data olarak eklemek
    request.fields['account_id'] = user.accountId!;
    request.fields['user_id'] = user.userId!;
    request.fields['date_of_birth'] = user.dateOfBirth!;
    request.fields['full_name'] = user.fullName!;
    request.fields['email'] = user.email!;
    request.fields['phone_number'] = user.phoneNumber!;
    if (user.password != null && user.password!.isNotEmpty) {
      request.fields['password'] = user.password!;
    }
    print(request.fields);
    request.headers['Content-Type'] = 'text/html; charset=utf-8';

    final response = await request.send();

    if (response.statusCode == 200) {
      // Success
      print("User updated successfully");
      return true;
    } else {
      // Failure
      print("Failed to update user. Error: ${response.statusCode}");
      return false;
    }
  }*/
}
