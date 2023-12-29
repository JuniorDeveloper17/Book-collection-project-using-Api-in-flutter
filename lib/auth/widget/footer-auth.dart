import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_msib1/core/dependency/dependency.dart';
import '../../core/theme/theme.dart';
import '../view/login.dart';
import '../view/register.dart';

class FooterAuth extends StatelessWidget {
  final bool islogin;
  const FooterAuth({
    required this.islogin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        islogin == true ? 'Belum punya akun?' : 'Sudah Punya Akun?',
        style: GoogleFonts.openSans(color: grey, fontSize: 15),
      ),
      SizedBox(width: 5),
      InkWell(
        onTap: () {
          if (islogin == true) {
            auth.usernameText('');
            Get.to(() => RegisterView(), transition: Transition.rightToLeft);
          } else if (islogin == false) {
            Get.to(() => LoginView(), transition: Transition.leftToRight);
          }
        },
        child: Text(
          islogin == true ? 'Daftar' : 'Masuk',
          style: GoogleFonts.openSans(
              color: blue, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      )
    ]);
  }
}
