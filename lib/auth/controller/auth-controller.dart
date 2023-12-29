import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_msib1/auth/view/login.dart';
import 'package:test_msib1/core/dependency/dependency.dart';
import 'package:test_msib1/core/widget/custom-error-alert.dart';
import 'package:test_msib1/core/widget/custom-succes-alert.dart';
import 'package:test_msib1/data/datasource/auth-data.dart';
import 'package:test_msib1/navigation/view/navigation.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  TextEditingController username = TextEditingController();

  RxString usernameText = ''.obs;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    repassword.dispose();
    username.dispose();
  }

  void clearText() {
    email.clear();
    password.clear();
    repassword.clear();
    username.clear();
  }

  void nextStep() {
    if (username.text != '') {
      usernameText(username.text);
    } else {
      snacbar(title: 'Kesalahan', messege: 'Username anda masih kosong');
    }
  }

  void register() async {
    if (email.text != '' && password.text != '' && repassword.text != '') {
      if (password.text == repassword.text) {
        isLoading(true);
        final data = await AuthDataSource().register(
            email: email.text,
            password: password.text,
            repasword: repassword.text,
            username: username.text);
        if (data != null) {
          isLoading(false);
          snacbarSukses(
              title: 'Berhasil!',
              messege: 'Selamat ${username.text}, kamu berhasil mendaftar');
          Get.to(() => LoginView());
        } else {
          isLoading(false);
          snacbar(
              title: 'Kesalahan',
              messege: 'Ups! sepertinya ada kesalahan, silahkan coba kembali');
        }
      } else {
        snacbar(
            title: 'Kesalahan',
            messege:
                'Pssword anda tidak sama, silahkan cek kembali dan coba lagi');
      }
    } else {
      snacbar(
          title: 'Kesalahan',
          messege:
              'Data anda belum lengkap, silahkan lengkapi terlebih dahulu');
    }
  }

  void login() async {
    if (email.text != '' && password.text != '') {
      isLoading(true);
      final data = await AuthDataSource()
          .login(email: email.text, password: password.text);
      if (data != null) {
        await profile.saveToken(token: data['token']);
        await profile.getUserData();
        isLoading(false);
        clearText();
        Get.offAll(() => NavigationView());
      } else {
        isLoading(false);
        snacbar(
            title: 'Kesalahan',
            messege: 'Ups! sepertinya ada kesalahan, silahkan coba kembali');
      }
    } else {
      snacbar(
          title: 'Kesalahan',
          messege:
              'Data anda belum lengkap, silahkan lengkapi terlebih dahulu');
    }
  }
}
