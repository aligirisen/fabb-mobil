import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../common/navigation_drawer.dart';

class MapScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Container(
        width: 100.w,
        height: 100.h,
        color: Colors.blue,
      ),
    );
  }
}
