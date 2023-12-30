import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_msib1/core/dependency/dependency.dart';
import 'package:test_msib1/data/datasource/book-data.dart';
import 'package:test_msib1/data/model/buku-model.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  
  Future<BukuModel?> getAllBook() async {
    final data = await BookDataSource(token: profile.tokens.value).getBook();
    if (data != null) {
      return BukuModel.fromJson(data);
    } else {
      return null;
    }
  }

  void lauchUrl({required String urls}) async {
    String url() {
      if (Platform.isAndroid) {
        return "${urls}";
      } else {
        return "${urls}";
      }
    }
    // ignore: deprecated_member_use
    if (await canLaunch(url())) {
      // ignore: deprecated_member_use
      await launch(url());
    } else {
      // ignore: deprecated_member_use
      await launch(url());
    }
  }

  TextEditingController search = TextEditingController();
  RxString searchText = ''.obs;
  RxInt jumlahBuku = 0.obs;

  @override
  void dispose() {
    super.dispose();
    search.dispose();
  }
}
