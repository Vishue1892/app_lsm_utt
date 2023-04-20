import 'package:app_languagesing/src/ui/email_create_screen.dart';
import 'package:app_languagesing/src/ui/email_singing_screen.dart';
import 'package:app_languagesing/src/ui/home.dart';
import 'package:app_languagesing/src/ui/home_screen.dart';
import 'package:app_languagesing/src/ui/intro_screen.dart';
import 'package:app_languagesing/src/ui/profile_screen.dart';
import 'package:app_languagesing/src/ui/se%C3%B1as_interface.dart';
import 'package:app_languagesing/src/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const splash = '/';
  static const intro = '/intro';
  static const createAccount = '/createAccount';
  static const signInEmail = '/signInEmail';
  static const screenprin = '/screenprin';
  static const home = '/home';
  static const profile = '/profile';
  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return _buildRoute(SplashScreen.create);
      case intro:
        return _buildRoute(IntroScreen.create);
      case profile:
        return _buildRoute(ProfileScreen.create);
      case home:
        return _buildRoute(HomeScreen.create);
      case screenprin:
        return _buildRoute(Home.create);
      case createAccount:
        return _buildRoute(EmailCreate.create);
      case signInEmail:
        return _buildRoute(EmailSignIn.create);
      default:
        throw Exception('Route does not exists');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}
