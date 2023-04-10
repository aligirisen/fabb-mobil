import 'package:get/get.dart';

class Employee {
  Employee({
    required this.name,
    required this.id,
    required this.isExpanded,
  });

  String name;
  String id;
  RxBool isExpanded;
}
