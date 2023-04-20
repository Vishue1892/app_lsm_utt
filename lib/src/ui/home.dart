import 'package:app_languagesing/src/navigation/routes.dart';
import 'package:app_languagesing/src/ui/aprender.dart';
import 'package:app_languagesing/src/ui/hometwo.dart';
import 'package:app_languagesing/src/ui/profile_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static Widget create(BuildContext context) => Home();

  @override
  Widget build(BuildContext context) {
    int indexTap = 0;
    final List<Widget> widgetsBarChildren = [
      const HomeLSMUTT(),
      const Aprender(),
      const ProfileScreen(),
    ];

    void onTapTapped(int index) {
      indexTap = index;
      if (index == 0) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const HomeLSMUTT()));
      } else if (index == 1) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const Aprender()));
      } else if (index == 2) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const ProfileScreen()));
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Bienvenido a LSM-UTT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 2),
          const Image(
            image: AssetImage('assets/img/logo.png'),
            height: 300,
            width: 250,
          ),
          const SizedBox(height: 26),
          const Text(
            'Crecer con lengua es el requisito indispensable para garantizar el desarrollo pleno de las potencialidades intelectivas, pero esta lengua debe cumplir además con el requisito de ser natural, esto es, utilizar canales abiertos de recepción y de emisión del mensaje; en el caso de las personas oyentes, la vía de ingreso de la información es el oído, por eso la palabra debe cumplir con el requisito de ser “oral”, mientras que la vía de salida pone en marcha el funcionamiento del aparato fono-articulador para garantizar la reproducción de los sonidos de la voz humana; esta particularidad determina su condición de personas audio-parlantes.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 82),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.account_circle, color: Colors.blue),
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.profile);
                    },
                    tooltip: 'Ir al perfil',
                    iconSize: 48,
                  ),
                  const Text(
                    'Perfil',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(width: 154),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.green),
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.home);
                    },
                    tooltip: 'Ir a las secciones',
                    iconSize: 48,
                  ),
                  const Text(
                    'Secciones',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
