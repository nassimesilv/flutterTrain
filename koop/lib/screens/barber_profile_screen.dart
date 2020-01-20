import 'package:flutter/material.dart';
import 'package:koop/components/bars/barberProfileBar.dart';
import 'package:koop/components/views/barberInfoView.dart';
import 'package:koop/components/views/barberPicturesView.dart';
import 'package:koop/components/views/commentsView.dart';
import 'package:koop/models/barber.model.dart';

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
    this._tabController = TabController(vsync: this, length: 4);
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
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.25,
              floating: true,
              pinned: false,
              title: Text(this.barber.name),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(130.0),
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
                      child: BarberProfileBar(),
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                context: context,
                child: TabBar(
                  controller: this._tabController,
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.grid_on)),
                    Tab(icon: Icon(Icons.list)),
                    Tab(icon: Icon(Icons.info)),
                    Tab(icon: Icon(Icons.comment)),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: this._tabController,
                children: <Widget>[
                  BarberPicturesView(),
                  Center(child: Text('Content of Profile')),
                  BarberInfoView(),
                  ListView(
                    padding: const EdgeInsets.all(20.0),
                    children: getCommentsList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final BuildContext context;
  final TabBar child;

  StickyTabBarDelegate({@required this.child, this.context});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      child: this.child,
      color: Theme.of(context).cardColor,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
