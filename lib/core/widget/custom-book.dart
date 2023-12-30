import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_msib1/data/model/buku-model.dart';
import 'dart:math';
import '../theme/theme.dart';

class BookWidget extends StatelessWidget {
  final Data? data;
  const BookWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 185,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: white,
          boxShadow: [BoxShadow(color: grey, offset: Offset(3, 2))],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
      child: Row(children: [
        Container(
          width: 10,
          decoration: BoxDecoration(
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/icon.png', width: 40),
              SizedBox(height: 10),
              Text(
                '${data?.title}',
                style: GoogleFonts.openSans(
                    color: indigo, fontSize: 13, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: 4),
              Text(
                "${data?.publisher}",
                style: TextStyle(fontSize: 10, color: black),textAlign: TextAlign.center,
              )
            ],
          ),
        )
      ]),
    );
  }
}
