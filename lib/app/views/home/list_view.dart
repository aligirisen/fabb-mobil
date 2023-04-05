import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home/list_view_controller.dart';
import '../../models/incident_model.dart';

class ListView extends GetView<ListViewController> {
  const ListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ListViewController>(
      () => ListViewController(),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child: Obx(() => ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                controller.incidents[panelIndex].isExpanded.value = !isExpanded;
              },
              children:
                  controller.incidents.map<ExpansionPanel>((Incident item) {
                return ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: ((context, isExpanded) {
                      return ListTile(title: Text(item.name));
                    }),
                    body: ListTile(
                      title: Text(item.incidentid),
                    ),
                    isExpanded: item.isExpanded.value);
              }).toList())),
        ),
      ),
    );
  }
}
