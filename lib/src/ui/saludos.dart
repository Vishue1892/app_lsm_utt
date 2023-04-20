import 'package:app_languagesing/src/ui/salu_mess.dart';
import 'package:flutter/material.dart';

class SaludScreen extends StatefulWidget {
  const SaludScreen({Key? key}) : super(key: key);

  @override
  _SaludScreenState createState() => _SaludScreenState();
}

class _SaludScreenState extends State<SaludScreen> {
  final List<String> words = [
    'Hola',
    'Adiós',
    'Buenos días',
    'Buenas tardes',
    'Buenas noches',
    'Gracias',
    'De nada',
    'Bien',
    'Mal',
    '¿Cómo estas?',
    'Mucho gusto en conocerte',
  ];

  void _showNumberDialog(String word) {
    String message = SaludoMessages[word] ?? "Mensaje por defecto";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Palabra: $word'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('Volver'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Siguiente'),
              onPressed: () {
                int index = words.indexOf(word);
                if (index < words.length - 1) {
                  Navigator.of(context).pop();
                  _showNumberDialog(words[index + 1]);
                } else {
                  // última palabra, no hacer nada
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 41, 248),
        title: const Text('Palabras'),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: words.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              _showNumberDialog(words[index]);
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color.fromARGB(255, 61, 131, 252),
              ),
              child: Center(
                child: Text(
                  words[index],
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
