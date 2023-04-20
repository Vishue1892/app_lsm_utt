import 'package:app_languagesing/src/bloc/auth_cubit.dart';
import 'package:app_languagesing/src/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:page_indicator/page_indicator.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => const IntroScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Bienvenido a LSM-UTT'),
      ),
      body: _IntroPager(),
    );
  }
}

class _IntroPager extends HookWidget {
  final String textuno =
      'El alfabeto manual. Las personas sordas instruidas (que sepan leer y escribir) de casi todo el mundo usan un grupo de señas para representar las letras del alfabeto con el que se escribe la lengua oral del país. Es esto lo que se denomina alfabeto manual o alfabeto dactilológico.';
  final String textdos =
      'El gesto se hace en tres tiempos: la víctima levanta la mano con la palma hacia afuera, luego dobla el pulgar y finalmente cierra los demás dedos sobre este, encapsulándolo para hacer referencia a "sentirse encerrado o atrapado". La palma de la mano debe apuntar hacia la persona a la que se pide ayuda.';
  final String texttres =
      'Lenguaje de señas gestos de manos concepto de comunicación. personajes de dibujos animados de jóvenes que muestran suerte dudan de la idea rechazo poder éxito shock pánico saludar emociones positivas y negativas con las manos';
  @override
  Widget build(BuildContext context) {
    final isSigningIn = context.watch<AuthCubit>().state is AuthSigningIn;

    return AbsorbPointer(
      absorbing: isSigningIn,
      child: PageIndicatorContainer(
        align: IndicatorAlign.bottom,
        length: 4,
        indicatorSpace: 12,
        indicatorColor: Colors.grey,
        indicatorSelectorColor: Color.fromARGB(255, 157, 9, 147),
        child: PageView(
          controller: usePageController(),
          children: <Widget>[
            _DescriptionPage(
              text: textuno,
              imagePath: 'assets/img/abecedario.jpg',
            ),
            _DescriptionPage(
              text: textdos,
              imagePath: 'assets/img/auxilios.png',
            ),
            _DescriptionPage(
              text: texttres,
              imagePath: 'assets/img/saludos.jpg',
            ),
            _LoginPage(),
          ],
        ),
      ),
    );
  }
}

class _DescriptionPage extends StatelessWidget {
  final String text;
  final String imagePath;

  const _DescriptionPage({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 200,
            height: 200,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<AuthCubit>();
    final isSigningIn = authCubit.state is AuthSigningIn;

    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/img/logo.png',
            width: 200,
            height: 200,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                ' Iniciar Sesion o Crea una cuenta',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (isSigningIn) const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _LoginButton(
                  text: 'Iniciar Sesión con google',
                  imagePath: 'assets/img/icon_google.png',
                  color: Colors.white,
                  textColor: Colors.grey,
                  onTap: () {
                    authCubit.signInWithGoogle();
                    //Navigator.pushNamed(context, Routes.singlanguaje);
                  },
                ),
                const SizedBox(height: 70),
                _LoginButton(
                  text: ' Iniciar Sesión con Email',
                  imagePath: 'assets/img/icon_email.png',
                  color: Colors.red,
                  textColor: Colors.white,
                  onTap: () {
                    authCubit.reset();
                    Navigator.pushNamed(context, Routes.signInEmail);
                  },
                ),
                const SizedBox(height: 68),
                OutlinedButton(
                  child: const Text('Crear Cuenta'),
                  onPressed: () {
                    authCubit.reset();
                    Navigator.pushNamed(context, Routes.createAccount);
                  },
                ),
                const SizedBox(height: 68),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback? onTap;
  final Color color;
  final Color textColor;

  const _LoginButton({
    Key? key,
    required this.text,
    required this.imagePath,
    this.onTap,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 3,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
