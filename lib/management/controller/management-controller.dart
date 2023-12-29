import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_msib1/core/dependency/dependency.dart';
import 'package:test_msib1/core/theme/theme.dart';
import 'package:test_msib1/core/widget/custom-error-alert.dart';
import 'package:test_msib1/core/widget/custom-succes-alert.dart';
import 'package:test_msib1/data/datasource/book-data.dart';
import 'package:test_msib1/data/model/buku-model.dart';
import 'package:intl/intl.dart';
import 'package:test_msib1/navigation/view/navigation.dart';

class ManagementController extends GetxController {
  RxBool refres = true.obs;
  RxBool isLoading = false.obs;

  Rx<BukuModel> bukuData = BukuModel().obs;

  Future getAllBook() async {
    final data = await BookDataSource(token: profile.tokens.value).getBook();
    bukuData(BukuModel.fromJson(data));
  }

  TextEditingController isbn = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController publisher = TextEditingController();
  TextEditingController published = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController pages = TextEditingController();
  RxString createdAtt = ''.obs;

  @override
  void dispose() {
    isbn.dispose();
    title.dispose();
    subtitle.dispose();
    author.dispose();
    publisher.dispose();
    published.dispose();
    description.dispose();
    website.dispose();
    pages.dispose();
    super.dispose();
  }

  void clearText() {
    isbn.clear();
    title.clear();
    subtitle.clear();
    author.clear();
    publisher.clear();
    published.clear();
    description.clear();
    website.clear();
    pages.clear();
    createdAtt('');
  }

  bool validation() {
    if (isbn.text != '' &&
        title.text != '' &&
        subtitle.text != '' &&
        author.text != '' &&
        publisher.text != '' &&
        published.text != '' &&
        description.text != '' &&
        website.text != '' &&
        pages.text != '') {
      return true;
    } else {
      snacbar(
          title: 'Kelasahan',
          messege:
              'Lengkapi semua form terlebih dahulu, dan silahkan coba kembali');
      return false;
    }
  }

  void addBook() async {
    bool validations = await validation();
    print(validations);
    if (validations == true) {
      isLoading(true);
      final data = await BookDataSource(token: profile.tokens.value).insertBook(
          data: Data(
        isbn: isbn.text,
        title: title.text,
        subtitle: subtitle.text,
        author: author.text,
        published: published.text,
        publisher: publisher.text,
        pages: int.parse(pages.text),
        description: description.text,
        website: website.text,
        createdAt:
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()).toString(),
        updatedAt:
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()).toString(),
      ));
      if (data != null) {
        isLoading(false);
        clearText();
        await getAllBook();
        snacbarSukses(
            title: 'Berhasil', messege: 'Buku baru telah di tambahkan!');
        Get.off(NavigationView());
      } else {
        isLoading(false);
        snacbar(
            title: 'Kesalahan',
            messege: 'Ups! sepertinya ada kesalahan teknis, coba kembali');
      }
    }
  }

  Future<Data?> getSpesifikBook({required int id}) async {
    final data = await BookDataSource(token: profile.tokens.value)
        .getSpesifikBook(id: id);
    if (data != null) {
      return Data.fromJson(data);
    } else {
      getSpesifikBook(id: id);
      return null;
    }
  }

  void updateBook({required int id}) async {
    bool validations = await validation();
    if (validations == true) {
      isLoading(true);
      final data = await BookDataSource(token: profile.tokens.value).updateBook(
          data: Data(
            isbn: isbn.text,
            title: title.text,
            subtitle: subtitle.text,
            author: author.text,
            published: published.text,
            publisher: publisher.text,
            pages: int.parse(pages.text),
            description: description.text,
            website: website.text,
            createdAt: createdAtt.value,
            updatedAt: DateFormat('yyyy-MM-dd HH:mm:ss')
                .format(DateTime.now())
                .toString(),
          ),
          id: id);
      if (data != null) {
        getAllBook();
        isLoading(false);
        snacbarSukses(
            title: 'Berhasil', messege: 'Buku ${title.text} telah di update!');
      } else {
        isLoading(false);
        snacbar(
            title: 'Kesalahan',
            messege: 'Ups! sepertinya ada kesalahan teknis, coba kembali');
      }
    }
  }

  void deleteBook({required int id, required Data item}) async {
    Get.defaultDialog(
        title: 'KONFIRMASI',
        titleStyle:
            TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.bold),
        content: Text(
          'Apakah kamu yakin ingin menghapus buku ${item.title}?',
          textAlign: TextAlign.center,
          style: TextStyle(color: black, fontSize: 13),
        ),
        confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: blue),
            onPressed: () {
              Get.back();
              deleteConfirm(id: id, item: item);
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

  void deleteConfirm({required int id, required Data item}) async {
    final data = await BookDataSource(token: profile.tokens.value)
        .deleteBook(id: id, data: item);
    if (data != null) {
      await getAllBook();
      isLoading(false);
      snacbarSukses(
          title: 'Berhasil', messege: 'Buku ${title.text} telah di dihapus!');
    } else {
      isLoading(false);
      snacbar(
          title: 'Kesalahan',
          messege: 'Ups! sepertinya ada kesalahan teknis, coba kembali');
    }
  }
}
