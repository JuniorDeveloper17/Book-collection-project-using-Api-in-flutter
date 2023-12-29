import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_msib1/core/widget/custom-loading-widget.dart';
import '../../core/dependency/dependency.dart';
import '../widget/custom-button-auth.dart';
import '../widget/custom-textfield-auth.dart';
import '../widget/footer-auth.dart';
import '../widget/header-auth.dart';
import '../widget/logo-auth.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(children: [
          HeaderAuth(title: 'REGISTER'),
          auth.usernameText.value == ''
              ? ListView(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  children: [
                    SizedBox(height: Get.height / 3),
                    LogoAuth(),
                    SizedBox(height: 40),
                    CustomTextField(
                        controller: auth.username,
                        hint: 'Username',
                        prefix: Icons.person,
                        isPassword: false),
                    SizedBox(height: 10),
                    CustomButtonAuth(
                        onpress: () => auth.nextStep(), title: 'Berikutnya'),
                    SizedBox(height: 10),
                    FooterAuth(islogin: false)
                  ],
                )
              : ListView(
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
                    CustomTextField(
                        controller: auth.repassword,
                        hint: 'Re password',
                        prefix: Icons.lock,
                        isPassword: true),
                    SizedBox(height: 10),
                    CustomButtonAuth(
                        onpress: () => auth.register(), title: 'Daftar'),
                    SizedBox(height: 10),
                    FooterAuth(islogin: false)
                  ],
                ),
          auth.isLoading.isTrue ? LoadingWidget(bg: true) : SizedBox()
        ]),
      ),
    );
  }
}
