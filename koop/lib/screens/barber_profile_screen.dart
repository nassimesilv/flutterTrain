import 'package:flutter/material.dart';
import 'package:koop/components/bars/barberProfileBar.dart';
import 'package:koop/components/views/barberInfoView.dart';
import 'package:koop/components/views/barberPicturesView.dart';
import 'package:koop/components/views/commentsView.dart';
import 'package:koop/models/barber.model.dart';


const double sliverBarExpandedHeight = 0.20;

Map<Widget, Widget> tabs = {
  Tab(icon: Icon(Icons.grid_on)): BarberPicturesView(),
  Tab(icon: Icon(Icons.list)): Center(child: Text('Content of Profile')),
  Tab(icon: Icon(Icons.info)): BarberInfoView(),
  Tab(icon: Icon(Icons.comment)): CommentsView(),
};

class BarberProfileScreen extends StatefulWidget {
  static String title = 'barber_profile_screen';
  final String barberId;

  BarberProfileScreen({this.barberId});

  @override
  _BarberProfileScreenState createState() => _BarberProfileScreenState();
}

class _BarberProfileScreenState extends State<BarberProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Barber barber;

  @override
  void initState() {
    this.barber = this.getBarber(widget.barberId);
    this._tabController = TabController(vsync: this, length: tabs.length);
    super.initState();
  }

  @override
  void dispose() {
    this._tabController.dispose();
    super.dispose();
  }

  Barber getBarber(String barberId) {
    // TODO request barber here is a fake barber
    Barber barber = Barber(
      barberId: 'barberId',
      name: 'Barber Shop',
      rating: 4.3.toString(),
      address: '30 Bis avenue du general sarrail, Chalons en chanmpagne',
      img: Image.asset('images/fakeBarberProfileImage.jpg'),
      distance: 2.3.toString(),
    );

    return barber;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(this.barber.name),
            centerTitle: true,
          ),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height *
                      sliverBarExpandedHeight,
                  floating: true,
                  pinned: false,
                  leading: Container(),
                  flexibleSpace: FlexibleSpaceBar(
                    background: BarberProfileBar(),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      controller: this._tabController,
                      tabs: <Widget>[
                        tabs.keys.elementAt(0),
                        tabs.keys.elementAt(1),
                        tabs.keys.elementAt(2),
                        tabs.keys.elementAt(3),
                      ],
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(
              controller: this._tabController,
              children: <Widget>[
                tabs.values.elementAt(0),
                tabs.values.elementAt(1),
                tabs.values.elementAt(2),
                tabs.values.elementAt(3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
