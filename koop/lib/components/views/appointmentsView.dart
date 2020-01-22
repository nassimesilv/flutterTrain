import 'package:flutter/material.dart';
import 'package:koop/components/cards/appointmentCard.dart';

class AppointmentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Mes RDV'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'A venir',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Tab(
                  child: Text(
                    'Passés',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(children: <Widget>[
                AppointmentCard(isComing: true,),
                AppointmentCard(isComing: true,),
                AppointmentCard(isComing: true,),
                AppointmentCard(isComing: true,),
              ],),
              ListView(children: <Widget>[
                AppointmentCard(isComing: false,),
                AppointmentCard(isComing: false,),
                AppointmentCard(isComing: false,),
                AppointmentCard(isComing: false,),
              ],),
            ],
          ),
        ),
      ),
    );
  }
}
