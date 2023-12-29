import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_msib1/core/dependency/dependency.dart';
import 'package:test_msib1/core/theme/theme.dart';
import 'package:test_msib1/core/widget/custom-loading-widget.dart';

import '../widget/widget-input.dart';

class AddBook extends StatelessWidget {
  const AddBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before,
            color: black,
            size: 30,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: white,
        title: Text(
          'Tambahkan buku baru',
          style: GoogleFonts.openSans(
              color: black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: ItemField(
                          controller: management.isbn,
                          title: 'ISBN',
                          maxlines: 1),
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: ItemField(
                          controller: management.published,
                          title: 'PUBLISHED',
                          maxlines: 1),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                        child: ItemField(
                            controller: management.author,
                            maxlines: 1,
                            title: 'AUTHOR')),
                    SizedBox(width: 15),
                    Flexible(
                        child: ItemField(
                            controller: management.publisher,
                            title: 'PUBLISHER',
                            maxlines: 1))
                  ],
                ),
                SizedBox(height: 20),
                ItemField(
                    controller: management.title, title: 'TITLE', maxlines: 1),
                ItemField(
                    controller: management.subtitle,
                    title: 'SUBTITLE',
                    maxlines: 2),
                ItemField(
                    controller: management.website,
                    title: 'WEBSITE',
                    maxlines: 1),
                ItemField(
                    controller: management.description,
                    title: 'DESCRIPTION',
                    maxlines: 5),
                ItemField(
                    controller: management.pages, title: 'PAGES', maxlines: 1),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => management.addBook(),
                  child: Container(
                    height: 50,
                    width: Get.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient:
                            RadialGradient(colors: [blue, indigo], radius: 3)),
                    child: Text(
                      'SIMPAN',
                      style: TextStyle(
                          color: grey100,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
          Obx(() => management.isLoading.isTrue
              ? LoadingWidget(bg: true)
              : SizedBox())
        ],
      ),
    );
  }
}
