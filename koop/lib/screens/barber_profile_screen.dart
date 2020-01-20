import 'package:flutter/material.dart';
import 'package:koop/components/barberProfileBar.dart';
import 'package:koop/components/barberProfileCommentsViewer.dart';
import 'package:koop/components/barberProfilePictureGrid.dart';
import 'package:koop/utils/constants.dart';
import 'package:koop/components/barberProfileInfoViewer.dart';

class Barber {
  String rating;
  String name;
}

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

  @override
  void initState() {
    // TODO: implement initState, get Barber informations
    this._tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    this._tabController.dispose();
    super.dispose();
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
              title: Text('Barber Shop'),
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
                  BarberProfilePictureGrid(),
                  Center(child: Text('Content of Profile')),
                  BarberProfileInfoViewer(),
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

List<BarberProfileComment> getCommentsList() {
  List<BarberProfileComment> commentsList = [
    BarberProfileComment(
      initials: 'SB',
      rating: 3.5.toString(),
      commentText: 'Barber de fou rien a redire',
    ),
    BarberProfileComment(
      initials: 'ND',
      rating: 2.9.toString(),
      commentText: 'Nul nul nul!',
    ),
    BarberProfileComment(
      initials: 'ME',
      rating: 5.toString(),
      commentText:
          'Les contours sont carre satisfait du taff du bon vieu ferufvhwevfhiwdfvbowiefvbiewrvbervewrvewve',
    ),
    BarberProfileComment(
      initials: 'AS',
      rating: 4.5.toString(),
      commentText: 'Parfait!',
    ),
    BarberProfileComment(
      initials: 'YK',
      rating: 3.5.toString(),
      commentText: 'Passable',
    )
  ];
  return commentsList;
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
