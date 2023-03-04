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
      throw Exception('Failed to load user data from API');
    }
  }
}
