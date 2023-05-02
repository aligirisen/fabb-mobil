import 'dart:convert';
import 'package:fabb_mobil/app/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class AuthService {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController? emailController, passwordController;

  Future<void> fetchUserData(String userId) async {
    // get
    final response = await http.get(Uri.parse('$baseUrl/user/$userId'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
    } else {
      throw Exception(
          'Failed to load user data from API: ${response.statusCode}');
    }
  }

  Future<bool> postRegister(User user) async {
    // register

    final Map<String, dynamic> userJson = {
      'full_name': user.fullName,
      'phone_number': user.phoneNumber,
      'email': user.email,
      'password': user.password,
    };

    // Send the POST request
    print(jsonEncode(userJson));
    http.Response response =
        await http.post(Uri.parse('$baseUrl/user/signup'), body: userJson);

    // Handle the response
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

  Future<bool> login(String email, String password) async {
    // login

    final response = await http
        .get(Uri.parse('$baseUrl/user/signin?email=$email&password=$password'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }
}
