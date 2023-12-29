import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/dependency/dependency.dart';
import '../../core/theme/theme.dart';

class ItemCredensial extends StatelessWidget {
  const ItemCredensial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.verified, color: blue, size: 25),
            SizedBox(width: 10),
            Text(
              '${profile.userData.value.emailVerifiedAt}',
              style: GoogleFonts.openSans(color: grey, fontSize: 15),
            )
          ],
        ),
        Divider(
          thickness: 0.3,
          color: grey,
          height: 20,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.update, color: blue, size: 25),
            SizedBox(width: 10),
            Text(
              '${profile.userData.value.updatedAt}',
              style: GoogleFonts.openSans(color: grey, fontSize: 15),
            )
          ],
        ),
        Divider(
          thickness: 0.3,
          color: grey,
          height: 20,
        ),
      ]),
    );
  }
}
