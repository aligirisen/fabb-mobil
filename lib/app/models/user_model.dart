import 'package:universal_html/html.dart';

class UserModel {
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

  UserModel({
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

  UserModel setAccountId(String accountId) {
    return UserModel(
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

  UserModel setDateOfBirth(DateTime dateofBirth) {
    return UserModel(
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

  UserModel setUserId(String userId) {
    return UserModel(
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

  UserModel setFullName(String fullName) {
    return UserModel(
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

  UserModel setPhoneNumber(String phoneNumber) {
    return UserModel(
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

  UserModel setEmail(String _email) {
    return UserModel(
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

  UserModel setIncident(List _incident) {
    return UserModel(
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

  UserModel setLikedIncidents(List likedIncidents) {
    return UserModel(
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

  UserModel setDislikedIncidents(List dislikedIncidents) {
    return UserModel(
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

  UserModel setLocation(Location _location) {
    return UserModel(
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

  UserModel setPassword(String _password) {
    return UserModel(
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
