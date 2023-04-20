import 'package:app_languagesing/src/ui/gradient_profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // const Stack(
        //   children: [GradientProfile(title: 'Perfil'), ],
        // );
        Scaffold(
      appBar: AppBar(
        title: const Text('LSM-UTT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bienvenido a Lenguaje de Señas UTT'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Icon(Icons.keyboard_return_outlined),
            ),
            const GradientProfile(title: 'Perfil'),
            _crearpaginas(),
          ],
        ),
      ),
    );
  }

  Widget _crearpaginas() {
    return TextField(
      enableInteractiveSelection: false,
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        color: Colors.amberAccent,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: Colors.red,
      cursorRadius: const Radius.circular(10.0),
      cursorWidth: 5.0,
      //maxLines: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Escriba fecha de Nacimiento",
        labelText: "Fecha de nacimiento:",
        prefixIcon: const Icon(Icons.calendar_month),
        //iconColor:Colors.blueGrey,//solo aplica para
        //prefixIcon:const CircularProgressIndicator(),
      ),
    );
  }
}
