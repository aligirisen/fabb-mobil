import 'dart:convert';
import 'package:fabb_mobil/app/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthService {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController? emailController, passwordController;

  final baseUrl = 'http://192.168.1.106:5111';

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


/* Yukarıdaki methodlar çalışır halde.


controller'la bağlanacak


class MyController extends GetxController {
  
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxBool isLoading = false.obs;
  
  void setName(String value) {
    name.value = value;
  }
  
  void setEmail(String value) {
    email.value = value;
  }
  
  void postData() async {
    isLoading.value = true;
    
    // Define the URL, headers, and body as before
    
    // Send the POST request
    http.Response response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
    
    isLoading.value = false;
    
    // Handle the response
    if (response.statusCode == 200) {
      // Success
      print("Data Posted Successfully!");
      name.value = '';
      email.value = '';
    } else {
      // Failure
      print("Failed to Post Data. Error: ${response.statusCode}");
    }
  }
  
  void resetForm() {
    name.value = '';
    email.value = '';
  }



    LOGIN PROVIDERINI ÇALIŞTIRACAK ELEMAN
  void _onLoginButtonPressed() async {
  final email = _emailController.text;
  final password = _passwordController.text;

  final success = await login(email, password);

  if (success) {
    Navigator.pushReplacementNamed(context, '/main');
  } else {
    setState(() {
      _errorMessage = 'Invalid email or password';
    });
  }
}

void _onLoginButtonPressed(final email, final password) async {
  final password = _passwordController.text;

  final success = await login(email, password);

  if (success) {
    Navigator.pushReplacementNamed(context, '/main');
  } else {
    setState(() {
      _errorMessage = 'Invalid email or password';
    });
  }
}


  
}








TextField(
  controller: TextEditingController(text: myController.name.value),
  onChanged: (value) => myController.setName(value),
  decoration: InputDecoration(
    labelText: 'Name',
    border: OutlineInputBorder(),
  ),
),









*/