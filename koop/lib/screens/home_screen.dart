import 'package:flutter/material.dart';
import 'package:koop/components/bars/bottomNavBar.dart';
import 'package:koop/components/views/homeScrollView.dart';
import 'package:koop/components/views/searchView.dart';
import 'package:koop/screens/cgu_screen.dart';

const String homeTabLabel = 'Acceuil';
const String searchTabLabel = 'Rechercher';
const String myAppointmentsTabLabel = 'Mes RDV';
const String settingsTabLabel = 'Paramètres';



class HomeScreen extends StatefulWidget {
  static String title = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<Widget, BottomNavyBarItem> tabs = {
  HomeScrollView(): BottomNavyBarItem(
    icon: Icon(Icons.home),
    title: Text(homeTabLabel),
  ), // TODO: Add search screen
  SearchView(): BottomNavyBarItem(
    icon: Icon(Icons.search),
    title: Text(searchTabLabel),
  ), // TODO: Add meetings screen
  CGUScreen(): BottomNavyBarItem(
    icon: Icon(Icons.calendar_today),
    title: Text(myAppointmentsTabLabel),
  ), // TODO: Add settings screen
  CGUScreen(): BottomNavyBarItem(
    icon: Icon(Icons.settings),
    title: Text(settingsTabLabel),
  ),
};

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
                tabs.keys.elementAt(0),
                tabs.keys.elementAt(1),
                tabs.keys.elementAt(2),
                tabs.keys.elementAt(3),
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
              tabs.values.elementAt(0),
              tabs.values.elementAt(1),
              tabs.values.elementAt(2),
              tabs.values.elementAt(3),
            ],
          ),
        ),
      ),
    );
  }
}


