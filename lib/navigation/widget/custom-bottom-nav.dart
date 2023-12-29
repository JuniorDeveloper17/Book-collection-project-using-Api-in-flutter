import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/dependency/dependency.dart';
import '../../core/theme/theme.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        unselectedItemColor: grey,
        selectedItemColor: blue,
        currentIndex: nav.pageIndex.value,
        onTap: (value) => nav.pageIndex(value),
        selectedLabelStyle: GoogleFonts.openSans(
            color: black, fontWeight: FontWeight.w600, fontSize: 12),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 25), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book, size: 25), label: 'Management'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 25), label: 'Profile')
        ],
      ),
    );
  }
}
