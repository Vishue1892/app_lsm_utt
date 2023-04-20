import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Review extends StatelessWidget {
  final String pathleccion;
  final String nameleccion;
  final String pathlecciondos;
  final String namelecciondos;
  const Review({
    super.key,
    required this.pathleccion,
    required this.nameleccion,
    required this.pathlecciondos,
    required this.namelecciondos,
  });

  @override
  Widget build(BuildContext context) {
    final imagen = Container(
      margin: const EdgeInsets.only(
        top: 80.0,
        left: 130,
      ),
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathleccion),
        ),
      ),
    );

    final nombre = Container(
      margin: const EdgeInsets.only(
        top: 30.0,
        left: 150.0,
      ),
      child: Text(
        nameleccion,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return Column(
      children: [imagen, nombre, imageother(context)],
    );
  }

  Widget imageother(BuildContext context) {
    final imagendos = Container(
      margin: const EdgeInsets.only(
        top: 140.0,
        left: 130.0,
      ),
      width: 130.0,
      height: 130.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathlecciondos),
        ),
      ),
    );

    final nombredos = Container(
      margin: const EdgeInsets.only(
        top: 40.0,
        left: 150.0,
      ),
      child: Text(
        namelecciondos,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return Column(
      children: [
        imagendos,
        nombredos,
      ],
    );
  }
}
