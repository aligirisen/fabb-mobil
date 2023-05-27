import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class GeneralAppDatas {
  static RxBool isLoggedIn = false.obs;
  //false guest true login
  static RxString userId = "".obs;

  static RxString userEmail = "".obs;

  static RxString selectedIncidentType = "".obs;

  static Rx<User> loggedInUser = User().obs;

  static Rx<Position?> currentPosition = Position(
          longitude: 39.925533,
          latitude: 32.866287,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0)
      .obs;
}
