import 'dart:html';

class user_model {
  final String account_id;
  final DateTime date_of_birth;
  final String user_id;
  final String full_name;
  final String phone_number;
  final String email;
  final List incident;
  final List liked_incidents;
  final List disliked_incidents;
  final Location location;

  user_model({
    required this.account_id,
    required this.date_of_birth,
    required this.user_id,
    required this.full_name,
    required this.phone_number,
    required this.email,
    required this.incident,
    required this.liked_incidents,
    required this.disliked_incidents,
    required this.location,
  });
}
