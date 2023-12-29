import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:test_msib1/core/theme/theme.dart';
import 'package:test_msib1/splashscreen/controller/splash-controller.dart';

class SplashScreen extends StatelessWidget {
  final c = Get.put(SplashController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon.png',
              width: 100,
            ),
            SizedBox(height: 10),
            GradientText('COLECTION BOOK',
                style: GoogleFonts.openSans(
                    fontSize: 14, fontWeight: FontWeight.w700),
                colors: [blue, indigo]),
            Container(
                width: 120,
                child: LinearProgressIndicator(
                  color: blue,
                ))
          ],
        ),
      ),
    );
  }
}
