import 'package:app_languagesing/src/ui/gradient_profile.dart';
import 'package:app_languagesing/src/ui/seccions_profile.dart';
import 'package:app_languagesing/src/ui/small_button_profile.dart';
import 'package:flutter/material.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        GradientProfile(title: 'Perfil'),
        SeccionsProfile(),
        SmallButtonProfile(),
      ],
    );
  }
}
