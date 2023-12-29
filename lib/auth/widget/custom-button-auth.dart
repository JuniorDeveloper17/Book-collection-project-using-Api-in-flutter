import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/theme.dart';

class CustomButtonAuth extends StatelessWidget {
  final String title;
  final VoidCallback? onpress;
  const CustomButtonAuth({
    required this.onpress,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        title,
        style: GoogleFonts.openSans(color: white, fontSize: 17),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: blue,
          fixedSize: Size(Get.width, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onpress,
    );
  }
}
