import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeccionProfile extends StatelessWidget {
  final String perfil;
  final String usuario;

  const SeccionProfile({
    super.key,
    required this.perfil,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    final profilePic = Container(
      margin: const EdgeInsets.only(
        top: 120.0,
        left: 20.0,
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(perfil),
        ),
      ),
    );

    final userName = Container(
      margin: const EdgeInsets.only(
        top: 80,
        left: 20.0,
      ),
      child: Text(
        usuario,
        textAlign: TextAlign.left,
        style: GoogleFonts.lato(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final userInfo = Container(
      margin: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Row(
        children: [],
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        userName,
        userInfo,
      ],
    );

    return Row(
      children: [
        profilePic,
        userDetails,
      ],
    );
  }
}
