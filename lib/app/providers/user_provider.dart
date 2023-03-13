import 'dart:convert';
import 'package:http/http.dart' as http;

class user_provider {
  final base_url = 'https://192.168.1.106:5111';
  final user_id = '';

  Future<void> fetchUserData(String user_id) async {
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
    String url = "https://192.168.1.106:5111/user/signup";

    // Define the headers
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    // Define the body
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
    final response = await http.post(
      Uri.parse('https://192.168.1.106:5111/user/login'),
      body: {'email': email, 'password': password},
    );
    return response.statusCode == 200;
  }
}


/* Yukarıdaki get methodu çalışır halde.


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