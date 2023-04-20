import 'package:app_languagesing/src/ui/aprender.dart';
import 'package:app_languagesing/src/ui/home.dart';
import 'package:app_languagesing/src/ui/home_screen.dart';
import 'package:app_languagesing/src/ui/hometwo.dart';
import 'package:app_languagesing/src/ui/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static Widget create(BuildContext context) => HomeScreen();

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
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Home()));
      }
    }

    return Scaffold(
      body: widgetsBarChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Color.fromARGB(255, 0, 91, 248),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 0, 41, 248),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: onTapTapped,
          currentIndex: indexTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: indexTap == 0 ? Colors.white : Colors.grey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined,
                  color: indexTap == 1 ? Colors.white : Colors.grey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_outlined,
                  color: indexTap == 2 ? Colors.white : Colors.grey),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
