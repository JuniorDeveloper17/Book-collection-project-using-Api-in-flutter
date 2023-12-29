import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_msib1/auth/widget/custom-button-auth.dart';
import 'package:test_msib1/auth/widget/custom-textfield-auth.dart';
import 'package:test_msib1/auth/widget/footer-auth.dart';
import 'package:test_msib1/auth/widget/header-auth.dart';
import 'package:test_msib1/auth/widget/logo-auth.dart';
import 'package:test_msib1/core/dependency/dependency.dart';

import '../../core/widget/custom-loading-widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(children: [
          HeaderAuth(title: 'LOGIN'),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 50),
            children: [
              SizedBox(height: Get.height / 3),
              LogoAuth(),
              SizedBox(height: 40),
              CustomTextField(
                  controller: auth.email,
                  hint: 'Email',
                  prefix: Icons.email,
                  isPassword: false),
              SizedBox(height: 10),
              CustomTextField(
                  controller: auth.password,
                  hint: 'Password',
                  prefix: Icons.lock,
                  isPassword: true),
              SizedBox(height: 10),
              CustomButtonAuth(onpress: () => auth.login(), title: 'Masuk'),
              SizedBox(height: 10),
              FooterAuth(islogin: true)
            ],
          ),
          auth.isLoading.isTrue ? LoadingWidget(bg: true) : SizedBox()
        ]),
      ),
    );
  }
}
