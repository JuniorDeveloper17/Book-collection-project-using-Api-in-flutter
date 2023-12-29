import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:test_msib1/core/dependency/dependency.dart';
import 'package:test_msib1/core/theme/theme.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 10, right: 10),
      height: 100,
      width: Get.width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: blue, offset: Offset(0, 2), blurRadius: 2)
          ],
          color: white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Image.asset('assets/images/icon.png', width: 30),
            SizedBox(width: 10),
            GradientText(
              'All Books',
              colors: [blue, indigo],
              style: GoogleFonts.openSans(
                  fontSize: 25, fontWeight: FontWeight.bold, color: black),
            ),
            Expanded(child: SizedBox()),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                    color: blue, borderRadius: BorderRadius.circular(20)),
                child: Obx(
                  () => Text(
                    "${home.jumlahBuku} Buku",
                    style: GoogleFonts.openSans(
                        color: white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ))
          ],
        ),
      ]),
    );
  }
}

 // Expanded(
 //             child: SizedBox(
 //               height: 40,
 //               child: TextField(
 //                 style: TextStyle(color: black, fontWeight: FontWeight.w500),
 //                 controller: home.search,
 //                 onChanged: (value) => home.searchText(value),
 //                 decoration: InputDecoration(
 //                     enabled: true,
 //                     filled: true,
 //                     fillColor: Colors.grey[300],
 //                     hintText: 'Cari buku...',
 //                     hintStyle:
 //                         TextStyle(color: grey, fontWeight: FontWeight.w400),
 //                     contentPadding:
 //                         EdgeInsets.symmetric(horizontal: 10, vertical: 3),
 //                     focusedBorder: OutlineInputBorder(
 //                         borderRadius: BorderRadius.circular(30),
 //                         borderSide: BorderSide.none),
 //                     enabledBorder: OutlineInputBorder(
 //                         borderRadius: BorderRadius.circular(30),
 //                         borderSide: BorderSide.none)),
 //               ),
 //             ),
 //           ),
 //           Obx(
 //             () => home.searchText.value != ''
 //                 ? IconButton(
 //                     onPressed: () {
 //                       home.searchText('');
 //                       home.search.clear();
 //                     },
 //                     icon: Icon(Icons.cancel, size: 30, color: red))
 //                 : IconButton(
 //                     onPressed: () {},
 //                     icon: Icon(Icons.search, size: 30, color: black)),
 //           )
 //