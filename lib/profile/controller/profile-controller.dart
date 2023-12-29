import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_msib1/auth/view/login.dart';
import 'package:test_msib1/core/dependency/dependency.dart';
import 'package:test_msib1/core/widget/custom-error-alert.dart';
import 'package:test_msib1/data/datasource/user-data.dart';
import 'package:test_msib1/data/model/user-model.dart';

import '../../core/theme/theme.dart';

class ProfileController extends GetxController {
  RxString tokens = ''.obs;

  Rx<UserModel> userData = UserModel().obs;

  Future saveToken({required String token}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
    tokens(token);
  }

  Future getUserData() async {
    final data = await UserDataSource(token: tokens.value).getUserData();
    if (data != null) {
      Map<String, dynamic> user = data as Map<String, dynamic>;
      userData(UserModel.fromJson(user));
    } else {
      getUserData();
    }
  }

  void logout() async {
    Get.defaultDialog(
        title: 'KONFIRMASI',
        titleStyle:
            TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.bold),
        content: Text(
          'Apakah kamu yakin ingin logout?',
          textAlign: TextAlign.center,
          style: TextStyle(color: black, fontSize: 13),
        ),
        confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: blue),
            onPressed: () {
              Get.back();
              Confirmlogout();
            },
            child: Text(
              'Yakin',
              style: TextStyle(
                  color: white, fontSize: 15, fontWeight: FontWeight.w500),
            )),
        cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: white),
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Batal',
              style: TextStyle(
                  color: black, fontSize: 15, fontWeight: FontWeight.w500),
            )));
  }

  Future Confirmlogout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final data = await UserDataSource(token: tokens.value).logout();
    if (data != null) {
      home.jumlahBuku(0);
      preferences.remove('token');
      Get.offAll(LoginView());
    } else {
      snacbar(
          title: 'Kesalahan',
          messege: 'Ups sepertinya ada yang salah, coba kembali');
    }
  }
}
