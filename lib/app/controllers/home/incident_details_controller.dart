import 'dart:io';

import 'package:fabb_mobil/app/controllers/home/list_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../general_app_datas/general_app_datas.dart';
import 'package:http/http.dart' as http;

import '../../models/incident_model.dart';
import '../../services/incident_service.dart';

class IncidentDetailsController extends GetxController {
  late TextEditingController titleTEController;
  late TextEditingController descriptionTEController;
  late TextEditingController addressTEController;
  RxString address = "".obs;

  final picker = ImagePicker();

  late Rx<File?> image = File("").obs;
  static IncidentDetailsController get to =>
      Get.find<IncidentDetailsController>();
  @override
  void onInit() {
    super.onInit();
    titleTEController = TextEditingController();
    descriptionTEController = TextEditingController();
    addressTEController = TextEditingController();
    image.value = File("");
    getAddressFromPosition();
  }

  void initialize() {
    Get.delete<IncidentDetailsController>();

    Get.put(IncidentDetailsController());
    titleTEController = TextEditingController();
    descriptionTEController = TextEditingController();
    addressTEController = TextEditingController();
    image.value = File("");
  }

  @override
  void onClose() {
    titleTEController.dispose();
    descriptionTEController.dispose();
    addressTEController.dispose();
  }

  void getAddressFromPosition() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        GeneralAppDatas.currentPosition.value!.latitude,
        GeneralAppDatas.currentPosition.value!.longitude);
    Placemark place = placemarks[0];
    address.value =
        "${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}";

    addressTEController.text = address.value;
  }
/*
  void openCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Get the selected image file
      final imageFile = File(pickedFile.path);

      // Perform your desired operation here (e.g., display the image on the screen or save it to a database)
    }
  }*/

  void onImageButtonPressd(ImageSource source) {
    try {
      getImage(source);
    } catch (e) {
      debugPrint;
    }
  }

  void getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null && pickedFile.path.isNotEmpty) {
      image.value = File(pickedFile.path);
    } else {
      // Handle the case where no image was selected or the path is empty
      image.value = File("");
      print('No image selected');
    }
  }

  void uploadImage(File imageFile) async {
    // API endpoint URL
    var url = Uri.parse('https://example.com/upload');

    var request = http.MultipartRequest('POST', url);

    var fileStream = http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    var multipartFile = http.MultipartFile('image', fileStream, length,
        filename: imageFile.path);

    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image uploaded!');
    } else {
      print('Image upload failed!');
    }
  }

  Future<bool> createIncident() async {
    IncidentModel incident = IncidentModel(
      userId: GeneralAppDatas.userId.value,
      title: titleTEController.text,
      incidentStatus: "Opened",
      location: LocationModel(
          latitude: GeneralAppDatas.currentPosition.value!.latitude,
          longitude: GeneralAppDatas.currentPosition.value!.longitude),
      category: GeneralAppDatas.selectedIncidentType.value,
      description: descriptionTEController.text,
      address: addressTEController.text,
      attachments: null,
      createDate: DateTime.now().toString(),
      incidentId: "",
      reportNumber: "AC-MOBIL",
      downvoteCount: 0,
      upvoteCount: 0,
      image: image.value,
    );

    bool isCreated =
        await IncidentService().postIncident(incident, image.value!);
    if (isCreated) {
      //ali buraya bu kodu neden yazdık??
      // ListViewController().generateItems();
      return true;
    } else {
      return false;
    }
  }

  reportOnClick() async {
    if (titleTEController.text != "" &&
        descriptionTEController.text != "" &&
        image.value?.path != "") {
      bool isCreated = await createIncident();
      print(isCreated);

      titleTEController.text = "";
      descriptionTEController.text = "";
      addressTEController.text = "";

      return isCreated;
    } else {
      return AlertDialog(
        title: Text("Something went wrong!"),
        content: Text("Try again."),
      );
    }
  }
}
