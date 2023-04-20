import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Aprender extends StatelessWidget {
  const Aprender({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 105, 105),
      child: Center(
        child: Text(
          'Aqui vamos a aprender',
          style: GoogleFonts.lato(
            fontSize: 30.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
