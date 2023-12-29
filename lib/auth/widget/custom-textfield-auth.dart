import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_msib1/core/theme/theme.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData prefix;
  final bool isPassword;

  const CustomTextField({
    required this.controller,
    required this.hint,
    required this.prefix,
    required this.isPassword,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: controller,
      style: GoogleFonts.openSans(
          color: black, fontSize: 17, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 17),
          hintText: hint,
          hintStyle: GoogleFonts.openSans(color: grey, fontSize: 15),
          filled: true,
          fillColor: grey200,
          prefixIcon: Icon(
            prefix,
            size: 25,
            color: blue,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
    );
  }
}