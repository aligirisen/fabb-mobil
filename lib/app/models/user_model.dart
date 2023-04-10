import 'package:universal_html/html.dart';

class User {
  final String? accountId;
  final DateTime? dateOfBirth;
  final String? userId;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String password;
  final List? incident;
  final List? likedIncidents;
  final List? dislikedIncidents;
  final Location? location;

  User({
    this.accountId,
    this.dateOfBirth,
    this.userId,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    this.incident,
    this.likedIncidents,
    this.dislikedIncidents,
    this.location,
  });

  String? get accountid => accountId;
  DateTime? get dateofbirth => dateOfBirth;
  String? get userid => userId;
  String get fullname => fullName;
  String get phonenumber => phoneNumber;
  String get emailAddress => email;
  String get passwords => password;
  List? get incidents => incident;
  List? get likedincidents => likedIncidents;
  List? get dislikedincidents => dislikedIncidents;
  Location? get userLocation => location;

  User setAccountId(String accountId) {
    return User(
      accountId: accountId,
      dateOfBirth: dateOfBirth,
      userId: userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
      password: password,
      incident: incident,
      likedIncidents: likedIncidents,
      dislikedIncidents: dislikedIncidents,
      location: location,
    );
  }

  User setDateOfBirth(DateTime dateofBirth) {
    return User(
      accountId: accountId,
      dateOfBirth: dateofBirth,
      userId: userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
      password: password,
      incident: incident,
      likedIncidents: likedIncidents,
      dislikedIncidents: dislikedIncidents,
      location: location,
    );
  }

  User setUserId(String userId) {
    return User(
      accountId: accountId,
      dateOfBirth: dateOfBirth,
      userId: userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
      password: password,
      incident: incident,
      likedIncidents: likedIncidents,
      dislikedIncidents: dislikedIncidents,
      location: location,
    );
  }

  User setFullName(String fullName) {
    return User(
      accountId: accountId,
      dateOfBirth: dateOfBirth,
      userId: userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
      password: password,
      incident: incident,
      likedIncidents: likedIncidents,
      dislikedIncidents: dislikedIncidents,
      location: location,
    );
  }

  User setPhoneNumber(String phoneNumber) {
    return User(
      accountId: accountId,
      dateOfBirth: dateOfBirth,
      userId: userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
      password: password,
      incident: incident,
      likedIncidents: likedIncidents,
      dislikedIncidents: dislikedIncidents,
      location: location,
    );
  }

  User setEmail(String _email) {
    return User(
      accountId: accountId,
      dateOfBirth: dateOfBirth,
      userId: userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: _email,
      password: password,
      incident: incident,
      likedIncidents: likedIncidents,
      dislikedIncidents: dislikedIncidents,
      location: location,
    );
  }

  User setIncident(List _incident) {
    return User(
      accountId: accountId,
      dateOfBirth: dateOfBirth,
      userId: userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
      password: password,
      incident: _incident,
      likedIncidents: likedIncidents,
      dislikedIncidents: dislikedIncidents,
      location: location,
    );
  }

  User setLikedIncidents(List likedIncidents) {
    return User(
      accountId: accountId,
      dateOfBirth: dateOfBirth,
      userId: userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
      password: password,
      incident: incident,
      likedIncidents: likedIncidents,
      dislikedIncidents: dislikedIncidents,
      location: location,
    );
  }

  User setDislikedIncidents(List dislikedIncidents) {
    return User(
      accountId: accountId,
      dateOfBirth: dateOfBirth,
      userId: userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
      password: password,
      incident: incident,
      likedIncidents: likedIncidents,
      dislikedIncidents: dislikedIncidents,
      location: location,
    );
  }

  User setLocation(Location _location) {
    return User(
      accountId: accountId,
      dateOfBirth: dateOfBirth,
      userId: userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
      password: password,
      incident: incident,
      likedIncidents: likedIncidents,
      dislikedIncidents: dislikedIncidents,
      location: _location,
    );
  }

  User setPassword(String _password) {
    return User(
      accountId: accountId,
      dateOfBirth: dateOfBirth,
      userId: userId,
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
      password: _password,
      incident: incident,
      likedIncidents: likedIncidents,
      dislikedIncidents: dislikedIncidents,
      location: location,
    );
  }
}
