import 'package:app_languagesing/src/ui/gradient_profile.dart';
import 'package:app_languagesing/src/ui/seccions.dart';
import 'package:flutter/material.dart';

class HomeLSMUTT extends StatelessWidget {
  const HomeLSMUTT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: crearvistas(context),
    );
  }

  Widget crearvistas(BuildContext context) {
    return Stack(
      children: <Widget>[
        const GradientProfile(title: 'Secciones'),
        ListView(
          children: const <Widget>[],
        ),
        const Seccions(),
      ],
    );
  }
}
