import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class WidgetProfile extends StatelessWidget {
  const WidgetProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AvatarGlow(
          glowColor: blue,
          glowRadiusFactor: 0.10,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                color: grey200,
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/profile.png'))),
          ),
        ),
      ],
    );
  }
}
