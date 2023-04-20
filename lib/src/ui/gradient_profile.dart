import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientProfile extends StatelessWidget {
  final String title;
  const GradientProfile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 185, 252),
            Color.fromARGB(255, 20, 109, 243),
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp,
        ),
      ),
      alignment: const Alignment(-0.0, -0.0),
      child: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: 30.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
