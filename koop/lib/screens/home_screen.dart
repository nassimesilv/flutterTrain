import 'package:flutter/material.dart';
import 'package:koop/components/bars/bottomNavBar.dart';
import 'package:koop/components/views/appointmentsView.dart';
import 'package:koop/components/views/homeScrollView.dart';
import 'package:koop/components/views/searchView.dart';
import 'package:koop/components/views/settingsView.dart';
import 'package:geolocator/geolocator.dart';
import 'package:koop/models/barberSlider.model.dart';
import 'package:koop/services/barberSliders.service.dart';

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
  Position _currentPosition;
  List<BarberSlider> _barberSliderList;

  int _selectedIndex = 0;
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    // this._getCurrentLocation();
    this._getHomeSliders();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium)
        .then((Position position) {
      setState(() {
        this._currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  void _getHomeSliders() {
    setState(() {
      this._barberSliderList = BarberSliderService().getHomeSliders(this._currentPosition);
    });
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
                HomeScrollView(sliders: this._barberSliderList),
                SearchView(currentPosition: this._currentPosition,),
                AppointmentsView(),
                SettingsView(),
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
                icon: Icon(Icons.search),
                title: Text(searchTabLabel),
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
