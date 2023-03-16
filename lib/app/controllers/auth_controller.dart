import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController? emailController, passwordController;

  RxString displayText = 'Enter a password'.obs;
  RxDouble passwordStrength = 0.0.obs;
  RegExp numRegExpress = RegExp(r".*[0-9].*");
  RegExp letterRegExpress = RegExp(r".*[A-Za-z].*");
  RxBool isPasswordHidden = true.obs;
  RxString falseLogin = ''.obs;
  RxString firstnName = ''.obs;

  final base_url = 'https://192.168.1.106:5111';
  final user_id = '-NQ0aJDZwrov9UsJ8Q2d';

  RxString password = ''.obs;
  RxString email = ''.obs;

  Future<void> fetchUserData(String user_id) async {
    // get
    final response = await http.get(Uri.parse('$base_url/user/$user_id'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
    } else {
      throw Exception(
          'Failed to load user data from API: ${response.statusCode}');
    }
  }

  void postRegister() async {
    // register
    String url = "https://192.168.1.106:5111/user/signup";

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    Map<String, dynamic> body = {
      "email": "mobil@gmail.com",
      "password": "deneme",
      "phone_number": "+905486214587",
      "full_name": "Ali ali"
    };

    // Send the POST request
    http.Response response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(body));

    // Handle the response
    if (response.statusCode == 200) {
      // Success
      print("Data Posted Successfully!");
    } else {
      // Failure
      print("Failed to Post Data. Error: ${response.statusCode}");
    }
  }

  Future<bool> login(String email, String password) async {
    // login

    const base_url = 'http://192.168.50.20:5111';
    final response = await http.get(
        Uri.parse('$base_url/user/signin?email=$email&password=$password'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
      return true;
    } else {
      print(response.statusCode);
      throw Exception('Failed to load user data from API');
      //return false;
    }
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 5) {
      return "Password must be longer than 6 characters";
    }
    return null;
  }

  bool checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    } else {
      loginFormKey.currentState!.save();
      return true;
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