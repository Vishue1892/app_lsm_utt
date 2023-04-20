import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionPlaceScreen extends StatelessWidget {
  final String namePlace;
  final String descriptionPlace;
  final int stars;
  const DescriptionPlaceScreen(
      {super.key,
      required this.namePlace,
      required this.descriptionPlace,
      required this.stars});

  @override
  Widget build(BuildContext context) {
    const TextStyle titleStyle = TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    );

    final star = Container(
      margin: const EdgeInsets.only(
        top: 323.0,
        right: 3.0,
      ),
      child: const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );

    final titleAndStars = Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Text(
            namePlace,
            style: titleStyle,
            textAlign: TextAlign.left,
          ),
        ),
        star,
        star,
        star,
        star,
      ],
    );

    Container description = Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Text(
        descriptionPlace,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );

    return Column(
      children: [
        titleAndStars,
        description,
        // const ButtonNavigate(buttonText: 'Navigate'),
      ],
    );
  }
}
