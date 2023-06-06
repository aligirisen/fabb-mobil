import 'package:fabb_mobil/app/services/user_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/incident_model.dart';
import '../models/user_model.dart';

class GeneralAppDatas {
  static final box = GetStorage();

  static RxBool isLoggedIn = false.obs;

  static RxInt solvedMyReport = 0.obs;
  static RxInt rejectedMyReport = 0.obs;
  static RxInt inProgressMyReport = 0.obs;
  static RxInt openedMyReport = 0.obs;
  //false guest true login
  static RxString userId = "".obs;

  static RxString userEmail = "".obs;

  static RxString selectedIncidentType = "".obs;

  //settings için geçici değerler

  static RxString phoneNumberSettings = "".obs;
  static RxString fullNameSettings = "".obs;
  static RxString birthDateSettings = "".obs;

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

  static RxList<IncidentModel> incidentListMap = <IncidentModel>[].obs;
  static RxList<IncidentModel> incidentListList = <IncidentModel>[].obs;
  static RxList<IncidentModel> myIncidentList = <IncidentModel>[].obs;

  void checkLoggedInStatus() {
    GeneralAppDatas.isLoggedIn.value =
        GeneralAppDatas.box.read('isLoggedIn') ?? false;
    if (GeneralAppDatas.isLoggedIn.value) {
      GeneralAppDatas.userId.value = GeneralAppDatas.box.read('userId') ?? "";
    }
  }

  void setLoggedInStatus(bool isLoggedIn, String userId) {
    GeneralAppDatas.isLoggedIn.value = isLoggedIn;
    GeneralAppDatas.userId.value = userId;
    GeneralAppDatas.box.write('isLoggedIn', isLoggedIn);
    GeneralAppDatas.box.write('userId', userId);
  }
}
