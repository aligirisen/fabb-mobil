import 'dart:html';

class user_model {
  final String account_id;
  final DateTime? date_of_birth;
  final String user_id;
  final String full_name;
  final String phone_number;
  final String email;
  final List? incident;
  final List? liked_incidents;
  final List? disliked_incidents;
  final Location? location;

  user_model({
    required this.account_id,
    this.date_of_birth,
    required this.user_id,
    required this.full_name,
    required this.phone_number,
    required this.email,
    this.incident,
    this.liked_incidents,
    this.disliked_incidents,
    this.location,
  });
  String get accountId => account_id;
  DateTime? get dateOfBirth => date_of_birth;
  String get userId => user_id;
  String get fullName => full_name;
  String get phoneNumber => phone_number;
  String get emailAddress => email;
  List? get incidents => incident;
  List? get likedIncidents => liked_incidents;
  List? get dislikedIncidents => disliked_incidents;
  Location? get userLocation => location;

  user_model setAccountId(String accountId) {
    return user_model(
      account_id: accountId,
      date_of_birth: date_of_birth,
      user_id: user_id,
      full_name: full_name,
      phone_number: phone_number,
      email: email,
      incident: incident,
      liked_incidents: liked_incidents,
      disliked_incidents: disliked_incidents,
      location: location,
    );
  }

  user_model setDateOfBirth(DateTime dateofBirth) {
    return user_model(
      account_id: account_id,
      date_of_birth: dateofBirth,
      user_id: user_id,
      full_name: full_name,
      phone_number: phone_number,
      email: email,
      incident: incident,
      liked_incidents: liked_incidents,
      disliked_incidents: disliked_incidents,
      location: location,
    );
  }

  user_model setUserId(String userId) {
    return user_model(
      account_id: accountId,
      date_of_birth: date_of_birth,
      user_id: userId,
      full_name: full_name,
      phone_number: phone_number,
      email: email,
      incident: incident,
      liked_incidents: liked_incidents,
      disliked_incidents: disliked_incidents,
      location: location,
    );
  }

  user_model setFullName(String fullName) {
    return user_model(
      account_id: accountId,
      date_of_birth: date_of_birth,
      user_id: user_id,
      full_name: fullName,
      phone_number: phone_number,
      email: email,
      incident: incident,
      liked_incidents: liked_incidents,
      disliked_incidents: disliked_incidents,
      location: location,
    );
  }

  user_model setPhoneNumber(String phoneNumber) {
    return user_model(
      account_id: accountId,
      date_of_birth: date_of_birth,
      user_id: user_id,
      full_name: full_name,
      phone_number: phoneNumber,
      email: email,
      incident: incident,
      liked_incidents: liked_incidents,
      disliked_incidents: disliked_incidents,
      location: location,
    );
  }

  user_model setEmail(String _email) {
    return user_model(
      account_id: accountId,
      date_of_birth: date_of_birth,
      user_id: user_id,
      full_name: full_name,
      phone_number: phone_number,
      email: _email,
      incident: incident,
      liked_incidents: liked_incidents,
      disliked_incidents: disliked_incidents,
      location: location,
    );
  }

  user_model setIncident(List _incident) {
    return user_model(
      account_id: accountId,
      date_of_birth: date_of_birth,
      user_id: user_id,
      full_name: full_name,
      phone_number: phone_number,
      email: email,
      incident: _incident,
      liked_incidents: liked_incidents,
      disliked_incidents: disliked_incidents,
      location: location,
    );
  }

  user_model setLikedIncidents(List likedIncidents) {
    return user_model(
      account_id: accountId,
      date_of_birth: date_of_birth,
      user_id: user_id,
      full_name: full_name,
      phone_number: phone_number,
      email: email,
      incident: incident,
      liked_incidents: likedIncidents,
      disliked_incidents: disliked_incidents,
      location: location,
    );
  }

  user_model setDislikedIncidents(List dislikedIncidents) {
    return user_model(
      account_id: accountId,
      date_of_birth: date_of_birth,
      user_id: user_id,
      full_name: full_name,
      phone_number: phone_number,
      email: email,
      incident: incident,
      liked_incidents: liked_incidents,
      disliked_incidents: dislikedIncidents,
      location: location,
    );
  }

  user_model setLocation(Location _location) {
    return user_model(
      account_id: accountId,
      date_of_birth: date_of_birth,
      user_id: user_id,
      full_name: full_name,
      phone_number: phone_number,
      email: email,
      incident: incident,
      liked_incidents: liked_incidents,
      disliked_incidents: disliked_incidents,
      location: _location,
    );
  }
}
