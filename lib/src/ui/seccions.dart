import 'package:app_languagesing/src/ui/abce_screen.dart';
import 'package:app_languagesing/src/ui/auxilios.dart';
import 'package:app_languagesing/src/ui/numeros.dart';
import 'package:app_languagesing/src/ui/saludos.dart';
import 'package:flutter/material.dart';

class Seccions extends StatelessWidget {
  const Seccions({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AbceScreen()),
                );
              },
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: Image.asset(
                      'assets/img/abecedario1.png',
                      height: 115,
                      width: 115,
                    ),
                  ),
                  Text('Abecedario'),
                  SizedBox(height: 55),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuxiliScreen()),
                ); // Aquí puedes definir la acción que se realizará al hacer clic en el botón.
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/primerosau.jpg',
                    height: 115,
                    width: 115,
                  ),
                  Text('Primeros Auxilios'),
                  SizedBox(height: 55),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NumScreen()),
                ); // Aquí puedes definir la acción que se realizará al hacer clic en el botón.
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/numeros.jpg',
                    height: 115,
                    width: 115,
                  ),
                  Text('Numeros'),
                  SizedBox(height: 55),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SaludScreen()),
                ); // Aquí puedes definir la acción que se realizará al hacer clic en el botón.
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/saludos1.jpg',
                    height: 115,
                    width: 115,
                  ),
                  Text('Saludos'),
                  SizedBox(height: 55),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
