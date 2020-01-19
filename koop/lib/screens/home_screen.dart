import 'package:flutter/material.dart';
import 'package:koop/components/bottomNavBar.dart';
import 'package:koop/components/circleAvatarBar.dart';
import 'package:koop/components/searchBar.dart';
import 'package:koop/components/smallSlideItem.dart';
import 'package:koop/screens/cgu_screen.dart';

class HomeScreen extends StatefulWidget {
  static String title = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
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
        child: Scaffold(
          body: Container(
            child: PageView(
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: <Widget>[
                HomeScrollView(),
                CGUScreen(),
                CGUScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: _selectedIndex,
            unselectedColor: Theme.of(context).accentColor,
            onItemSelected: (index) {
              _pageController.jumpToPage(index);
            },
            selectedColor: Theme.of(context).accentColor,
            showElevation: false,
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Acceuil'),
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.calendar_today),
                title: Text('Mes RDV'),
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScrollView extends StatelessWidget {
  const HomeScrollView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.2,
          floating: true,
          pinned: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(110.0),
            child: Text(''),
          ),
          flexibleSpace: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: SearchBar(),
                ),
                Expanded(
                  child: CircleAvatarBar(),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(getHorizontalSliders(),),
        )
      ],
    );
  }
}

List<HorizontalSlider> getHorizontalSliders() {
  List<HorizontalSlider> horizontalSliderList = [
    HorizontalSlider(sliderTitle: 'Dans le coin'),
    HorizontalSlider(sliderTitle: 'Tendances'),
    HorizontalSlider(sliderTitle: 'Favoris'),
  ];
  return horizontalSliderList;
}

class HorizontalSlider extends StatelessWidget {
  final String sliderTitle;

  HorizontalSlider({@required this.sliderTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          HorizontalSliderTitle(title: this.sliderTitle),
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getSmallSlideItems('around'),
            ),
          ),
        ],
      ),
    );
  }
}

List<SmallSlideItem> getSmallSlideItems(String sliderType) {
  // slider type property is for example favorites, around, trending, ...
  //TODO Request slider from background
  List<SmallSlideItem> smallSlideItemList = [];
  const smallSlideItemLength = 5;
  for (int i = 0; i < smallSlideItemLength; i++) {
    smallSlideItemList.add(
      SmallSlideItem(
        distance: 2.5.toString(),
        address: '30B avenue du general sarrail, chalons en champagne',
        rating: '3.5',
        img: null,
        name: 'Barber Shop',
      ),
    );
  }
  return smallSlideItemList;
}

class HorizontalSliderTitle extends StatelessWidget {
  final String title;
  //TODO add route property to navigate to

  HorizontalSliderTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          this.title,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        FlatButton(
          child: Text(
            "Tout voir",
            style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            //TODO Add navigation to favorite view
          },
        ),
      ],
    );
  }
}
