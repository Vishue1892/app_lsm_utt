import 'package:flutter/material.dart';

class SmallButtonProfile extends StatefulWidget {
  const SmallButtonProfile({super.key});

  @override
  State<SmallButtonProfile> createState() => _SmallButtonProfileState();
}

class _SmallButtonProfileState extends State<SmallButtonProfile> {
  bool pressed = false;
  void onPressedSave() {
    setState(() {
      if (!pressed) {
        pressed = true;
      } else {
        pressed = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: const Alignment(1.9, 10.1),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color.fromARGB(236, 80, 238, 255),
                mini: true,
                tooltip: 'Editar foto de perfil',
                child: const Icon(Icons.edit),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color.fromARGB(236, 80, 238, 255),
                tooltip: 'Editar nombre',
                child: const Icon(Icons.edit_attributes),
              ),
            ],
          ),
          Positioned(
            bottom: 100,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color.fromARGB(236, 80, 238, 255),
              mini: true,
              tooltip: 'Cerrar sesión',
              child: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
