import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/icon.png'))),
        ),
      ],
    );
  }
}
