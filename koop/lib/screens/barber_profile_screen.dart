import 'package:flutter/material.dart';
import 'package:koop/components/bars/barberProfileBar.dart';
import 'package:koop/components/views/barberInfoView.dart';
import 'package:koop/components/views/barberPicturesView.dart';
import 'package:koop/components/views/barberServicesView.dart';
import 'package:koop/components/views/commentsView.dart';
import 'package:koop/models/barber.model.dart';

const double sliverBarExpandedHeight = 0.20;

Map<Tab, Widget> barberProfileTabs = {
  Tab(icon: Icon(Icons.grid_on)): BarberPicturesView(),
  Tab(icon: Icon(Icons.list)): BarberServicesView(),
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
    this._tabController =
        TabController(vsync: this, length: barberProfileTabs.length);
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
                    background: BarberProfileBar(
                      tabController: this._tabController,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      unselectedLabelColor: Theme.of(context).primaryTextTheme.title.color,
                      controller: this._tabController,
                      tabs: <Widget>[
                        Tab(icon: Icon(Icons.grid_on, color: Theme.of(context).primaryTextTheme.title.color)),
                        Tab(icon: Icon(Icons.list, color: Theme.of(context).primaryTextTheme.title.color)),
                        Tab(icon: Icon(Icons.info, color: Theme.of(context).primaryTextTheme.title.color)),
                        Tab(icon: Icon(Icons.comment, color: Theme.of(context).primaryTextTheme.title.color)),
                      ],
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(
              controller: this._tabController,
              children: <Widget>[
                BarberPicturesView(),
                BarberServicesView(),
                BarberInfoView(),
                CommentsView(),
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
