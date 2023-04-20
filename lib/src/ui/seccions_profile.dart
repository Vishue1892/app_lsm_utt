import 'package:app_languagesing/src/ui/seccion_profile.dart';
import 'package:flutter/material.dart';

class SeccionsProfile extends StatelessWidget {
  const SeccionsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeccionProfile(
          perfil: 'assets/img/imagenuno.jpeg',
          usuario: 'Victor Sanchez B',
        ),
      ],
    );
  }
}
