import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class LoadingWidget extends StatelessWidget {
  final bool bg;
  const LoadingWidget({
    required this.bg,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width,
        color:
            bg == true ? const Color.fromARGB(50, 0, 0, 0) : Colors.transparent,
        alignment: Alignment.center,
        child: SpinKitChasingDots(
          color: blue,
        ));
  }
}
