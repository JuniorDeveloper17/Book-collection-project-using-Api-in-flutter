import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_msib1/core/theme/theme.dart';

class HeaderAuth extends StatelessWidget {
  final String title;
  const HeaderAuth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width * 2.5 / 3 - 50,
      width: Get.width,
      child: Stack(
        children: [
          Positioned(
            left: -Get.width * 2.5 / 3 / 3,
            top: -Get.width * 2.5 / 3 / 3,
            child: Container(
              width: Get.width * 2.5 / 3,
              height: Get.width * 2.5 / 3,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [blue, indigo], radius: 2),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(57, 159, 159, 159),
                        offset: Offset(3, 3),
                        blurRadius: 5,
                        spreadRadius: 5)
                  ]),
              child: Padding(
                padding: EdgeInsets.only(top: 60, left: 50),
                child: Text(
                  '${title}',
                  style: GoogleFonts.openSans(
                      color: white, fontSize: 35, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
