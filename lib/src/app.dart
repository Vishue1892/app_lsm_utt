import 'package:app_languagesing/src/bloc/auth_cubit.dart';
import 'package:app_languagesing/src/navigation/routes.dart';
import 'package:app_languagesing/src/ui/home_screen.dart';
import 'package:app_languagesing/src/ui/intro_screen.dart';
import 'package:app_languagesing/src/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static Widget create() {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedOut) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.intro, (r) => false);
        } else if (state is AuthSignedIn) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.screenprin, (r) => false);
        }
      },
      child: const MyApp(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      title: '',
      onGenerateRoute: Routes.routes,
      initialRoute: Routes.intro, // agregamos la ruta inicial
      routes: {
        Routes.intro: (context) => IntroScreen(), // agregamos la ruta de intro
        Routes.home: (context) => HomeScreen(), // agregamos la ruta de home
        Routes.profile: (context) => ProfileScreen.create(context),
      },
    );
  }
}
