import 'package:get/get.dart';

class Incident {
  Incident({
    required this.name,
    required this.id,
    required this.isExpanded,
  });

  String name;
  String id;
  RxBool isExpanded;
}
