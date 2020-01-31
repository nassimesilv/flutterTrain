import 'package:flutter/material.dart';
import 'package:koop/components/bars/barberProfileBar.dart';
import 'package:koop/components/views/barberInfoView.dart';
import 'package:koop/components/views/barberPicturesView.dart';
import 'package:koop/components/views/barberServicesView.dart';
import 'package:koop/components/views/commentsView.dart';
import 'package:koop/models/barber.model.dart';
import 'package:koop/services/auth.service.dart';
import 'package:koop/utils/constants.dart';



class BarberProfileScreen extends StatefulWidget {
  static String title = 'barber_profile_screen';
  final String barberId;
  final BarberModel model;

  BarberProfileScreen({this.barberId, this.model});

  @override
  _BarberProfileScreenState createState() => _BarberProfileScreenState();
}

class _BarberProfileScreenState extends State<BarberProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  BarberModel barber;

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

  BarberModel getBarber(String barberId) {
    // TODO request barber here is a fake barber
    BarberModel barber = BarberModel(
      barberId: 'barberId',
      name: 'Barber Shop',
      rate: 4.3,
      address: Address(label: '30 Bis avenue du general sarrail, Chalons en chanmpagne'),
      imagePath: 'images/fakeBarberProfileImage.jpg',
      distance: 2.3,
    );

    return barber;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryTextTheme.title.color,
            ),
            title: Text(widget.model.name),
            centerTitle: true,
          ),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height *
                      kBarberProfileAppBarExpandedHeightRatio,
                  floating: true,
                  pinned: false,
                  leading: Container(),
                  flexibleSpace: FlexibleSpaceBar(
                    background: BarberProfileBar(
                      model: widget.model,
                      tabController: this._tabController,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      unselectedLabelColor:
                          Theme.of(context).primaryTextTheme.title.color,
                      controller: this._tabController,
                      tabs: <Widget>[
                        Tab(
                            icon: Icon(Icons.grid_on,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .title
                                    .color)),
                        Tab(
                            icon: Icon(Icons.list,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .title
                                    .color)),
                        Tab(
                            icon: Icon(Icons.info,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .title
                                    .color)),
                        Tab(
                            icon: Icon(Icons.comment,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .title
                                    .color)),
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
