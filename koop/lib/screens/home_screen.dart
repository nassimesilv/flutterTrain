import 'package:flutter/material.dart';
import 'package:koop/components/bars/bottomNavBar.dart';
import 'package:koop/components/views/homeScrollView.dart';
import 'package:koop/screens/cgu_screen.dart';

const String homeTabLabel = 'Acceuil';
const String myAppointmentsTabLabel = 'Mes RDV';
const String settingsTabLabel = 'Paramètres';

class HomeScreen extends StatefulWidget {
  static String title = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        // TODO: Add unfocus on tap enter keybord
        child: Scaffold(
          body: Container(
            child: PageView(
              controller: pageController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: <Widget>[
                HomeScrollView(),
                CGUScreen(), // TODO: Add meeting screen
                CGUScreen(), // TODO: Add settings screen
              ],
            ),
          ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: _selectedIndex,
            unselectedColor: Theme.of(context).accentColor,
            onItemSelected: (index) {
              pageController.jumpToPage(index);
            },
            selectedColor: Theme.of(context).accentColor,
            showElevation: true,
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text(homeTabLabel),
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.calendar_today),
                title: Text(myAppointmentsTabLabel),
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text(settingsTabLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}