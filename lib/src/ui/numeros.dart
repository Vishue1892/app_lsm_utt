import 'package:app_languagesing/src/ui/num_mess.dart';
import 'package:flutter/material.dart';

class NumScreen extends StatefulWidget {
  const NumScreen({Key? key}) : super(key: key);

  @override
  _NumScreenState createState() => _NumScreenState();
}

class _NumScreenState extends State<NumScreen> {
  final List<int> numbers = List.generate(20, (index) => index + 1);

  void _showNumberDialog(String number) {
    String message = numberMessages[int.parse(number)] ?? "Mensaje por defecto";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Número $number'),
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
                int index = numbers.indexOf(int.parse(number));
                if (index < numbers.length - 1) {
                  Navigator.of(context).pop();
                  _showNumberDialog(numbers[index + 1].toString());
                } else {
                  // última letra, no hacer nada
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
        title: const Text('Números'),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: numbers.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              _showNumberDialog(numbers[index].toString());
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color.fromARGB(255, 61, 131, 252),
              ),
              child: Center(
                child: Text(
                  numbers[index].toString(),
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
