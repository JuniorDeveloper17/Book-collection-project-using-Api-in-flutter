import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

void snacbarSukses({required String title, required String messege}) {
  Get.snackbar('', '',
      titleText: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: white, fontSize: 17)),
      messageText: Text(
        messege,
        style: TextStyle(color: white),
      ),
      overlayBlur: 3,
      barBlur: 10,
      backgroundGradient: RadialGradient(colors: [blue, indigo]),
      duration: Duration(seconds: 4));
}
