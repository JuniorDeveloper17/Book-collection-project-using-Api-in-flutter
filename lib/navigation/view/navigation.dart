import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_msib1/navigation/widget/custom-bottom-nav.dart';
import '../../core/dependency/dependency.dart';
import '../../core/theme/theme.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => nav.pageWidget.elementAt(nav.pageIndex.value)),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
            color: grey100,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(34, 33, 149, 243),
                  offset: Offset(0.5, -1),
                  blurRadius: 1)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        child: BottomNav(),
      ),
    );
  }
}
