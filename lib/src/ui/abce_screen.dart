import 'package:app_languagesing/src/ui/letter_mss.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AbceScreen extends StatefulWidget {
  const AbceScreen({Key? key}) : super(key: key);

  @override
  _AbceScreenState createState() => _AbceScreenState();
}

class _AbceScreenState extends State<AbceScreen> {
  List<Map<String, dynamic>> alphabet = [];
  FirebaseStorage storage = FirebaseStorage.instance;
  List<String> imageUrls = [
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FA.jpg?alt=media&token=7ceb3365-6c96-49c8-b151-ca8889568009', // URL de imagen para la letra A
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FB.jpg?alt=media&token=2362acc1-6409-490b-b605-203038d21e48', // URL de imagen para la letra B
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FC.jpg?alt=media&token=d7b26518-7f6e-44e3-9112-7e95608bba1a',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FD.jpg?alt=media&token=55417a87-3ac9-487c-9b7b-4f0ae2af9800',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FE.jpg?alt=media&token=a3fe729d-7953-43de-a2d5-b112dd1cf507',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FF.jpg?alt=media&token=ea63b405-bb14-478f-8b4b-7c46aecfe7b7',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FG.jpg?alt=media&token=5a5ffaff-9df4-4028-9558-8192a6db332f',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FH.jpg?alt=media&token=1e210a46-e0ad-490a-8344-5fe3f34a3309',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FI.jpg?alt=media&token=1f12ec54-d876-4dd0-afb8-59394416f3c2',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FJ.jpg?alt=media&token=6f6264a8-35c7-4ad1-86f0-cca8733353bd   ',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FK.jpg?alt=media&token=814b900a-274d-4128-9bf0-64bb44ba448c',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FL.jpg?alt=media&token=7ab22b4e-171b-4730-92bc-a8a5ff4ce73d',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FM.jpg?alt=media&token=94906e3b-2a25-4fd5-aa43-1d1a65ec2ce0',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FN.jpg?alt=media&token=6d60f627-58a8-4823-b016-f1041da7a199',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FO.jpg?alt=media&token=08f923e1-6a20-4edf-befc-906adba12cc1',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FP.jpg?alt=media&token=dde1872b-aea3-41ac-b8c6-a80dbfb2fa44',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FQ.jpg?alt=media&token=a5f34fc5-b9b8-4a75-969f-e05524c55829',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FR.jpg?alt=media&token=b34f532d-cf17-4fbf-97ee-8d66650eb668',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FS.jpg?alt=media&token=19ba601e-6b0f-407f-83f4-35cb6b7563fa',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FT.jpg?alt=media&token=0416711f-afad-4ad1-b388-d2c8d2092c95',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FV.jpg?alt=media&token=11fd1b8c-457f-4e3c-9692-ef453630eb11',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FV.jpg?alt=media&token=11fd1b8c-457f-4e3c-9692-ef453630eb11',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FW.jpg?alt=media&token=3a95ff26-a588-43f9-b001-127212fd2ee6',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FX.jpg?alt=media&token=150192dd-d0a5-44fa-a38b-ecc982b1e45a',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FY.jpg?alt=media&token=619d781e-0a5b-4e48-916a-12c3ae15cee3',
    'https://firebasestorage.googleapis.com/v0/b/lsm-uttlax-50249.appspot.com/o/Imagenes%2FZ.jpg?alt=media&token=a33cb295-99ff-41f8-a769-fda0780885d5',
  ];

  @override
  void initState() {
    super.initState();
    // Llenar la lista "alphabet" con las letras del abecedario
    alphabet = List.generate(
      26,
      (index) => {
        'letter': String.fromCharCode('A'.codeUnitAt(0) + index),
      },
    );
  }

  void _showLetterDialog(Map<String, dynamic> letter) async {
    String message = letterMessages[letter['letter']] ?? 'Mensaje por defecto';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Letra ${letter['letter']}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                imageUrls[alphabet.indexOf(
                    letter)], // Obtener la URL de imagen correspondiente a la letra actual
              ),
              const SizedBox(height: 16.0),
              Text(message),
            ],
          ),
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
                int index = alphabet.indexOf(letter);
                if (index < alphabet.length - 1) {
                  Navigator.of(context).pop();
                  _showLetterDialog(alphabet[index + 1]);
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
        title: const Text('Abecedario'),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: alphabet.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              _showLetterDialog(alphabet[index]);
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color.fromARGB(255, 61, 131, 252),
              ),
              child: Center(
                child: Text(
                  alphabet[index]['letter'],
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
