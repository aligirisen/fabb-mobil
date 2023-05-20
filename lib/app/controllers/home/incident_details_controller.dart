import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import '../../general_app_datas/general_app_datas.dart';
import 'package:http/http.dart' as http;

class IncidentDetailsController extends GetxController {
  late TextEditingController titleTEController;
  late TextEditingController descriptionTEController;
  late TextEditingController addressTEController;
  RxString address = "".obs;

  final picker = ImagePicker();

  late Rx<File?> image = File("").obs;

  @override
  void onInit() {
    super.onInit();
    titleTEController = TextEditingController();
    descriptionTEController = TextEditingController();
    addressTEController = TextEditingController();
    getAddressFromPosition();
  }

  void getAddressFromPosition() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        GeneralAppDatas.currentPosition.value!.latitude,
        GeneralAppDatas.currentPosition.value!.longitude);
    Placemark place = placemarks[0];
    address.value =
        "${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}";

    addressTEController.text = address.value;

    print(address.value);
  }

  void openCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Get the selected image file
      final imageFile = File(pickedFile.path);

      // Perform your desired operation here (e.g., display the image on the screen or save it to a database)
    }
  }

  void onImageButtonPressd(ImageSource source) {
    try {
      getImage(source);
    } catch (e) {
      print(e);
    }
  }

  void getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null && pickedFile.path.isNotEmpty) {
      image.value = File(pickedFile.path);
    } else {
      // Handle the case where no image was selected or the path is empty
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
}
