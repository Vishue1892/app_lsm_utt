import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuxiliScreen extends StatefulWidget {
  const AuxiliScreen({Key? key}) : super(key: key);

  @override
  _AuxiliScreenState createState() => _AuxiliScreenState();
}

class _AuxiliScreenState extends State<AuxiliScreen> {
  final List<String> topics = [
    'Quemaduras',
    'Heridas',
    'Fracturas',
    'Desmayos',
    'Picaduras',
    'Asfixia',
    'Convulsiones',
    'Intoxicaciones',
    'Mordeduras',
    'Golpes',
    'Shock'
  ];

  void _showTopicDialog(String topic) {
    // Aquí podrías implementar la lógica para mostrar información específica de cada tema
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tema: $topic'),
          content: Text('Información sobre $topic'),
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
                int index = topics.indexOf(topic);
                if (index < topics.length - 1) {
                  Navigator.of(context).pop();
                  _showTopicDialog(topics[index + 1]);
                } else {
                  // último tema, no hacer nada
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
        title: const Text('Primeros Auxilios'),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: topics.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              _showTopicDialog(topics[index]);
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color.fromARGB(255, 61, 131, 252),
              ),
              child: Center(
                child: Text(
                  topics[index],
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
