import 'package:get/get.dart';
import '../models/incident_model.dart';

class ListViewController extends GetxController {
  late List<Incident> incidents;

  @override
  void onInit() {
    super.onInit();
    incidents = generateItems(20);
  }

  List<Incident> generateItems(int numberOfItems) {
    return List.generate(numberOfItems, (int index) {
      return Incident(
          name: 'Incident - $index',
          id: 'Incident - $index Details',
          isExpanded: false.obs);
    });
  }
}
