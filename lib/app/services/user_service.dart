import 'dart:convert';
import 'package:fabb_mobil/app/general_app_datas/general_app_datas.dart';

import '../../main.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<String> fetchUserData(String userId) async {
    //await Future.delayed(Duration(seconds: 2)); // 2 saniye gecikme

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
    //await Future.delayed(Duration(seconds: 2)); // 2 saniye gecikme

    final response = await http.get(Uri.parse('$baseUrl/user/$userId'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      GeneralAppDatas.birthDateSettings.value = jsonData['date_of_birth'];
      GeneralAppDatas.fullNameSettings.value = jsonData['full_name'];
      GeneralAppDatas.phoneNumberSettings.value = jsonData['phone_number'];
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
    final Map<String, dynamic> userJson = {
      'account_id': user.accountId,
      'user_id': user.userId,
      'date_of_birth': user.dateOfBirth,
      'full_name': user.fullName,
      'email': user.email,
      'phone_number': user.phoneNumber,
    };
    print(jsonEncode(userJson));
    http.Response response =
        await http.put(Uri.parse('$baseUrl/user/update'), body: userJson);

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
}
