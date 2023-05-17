import 'package:get/get.dart';

import '../models/user_model.dart';

class GeneralAppDatas {
  static RxBool isLoggedIn = true.obs;
  //false guest true login

  static RxString selectedIncidentType = "".obs;

  static Rx<User> loggedInUser = User().obs;
}
