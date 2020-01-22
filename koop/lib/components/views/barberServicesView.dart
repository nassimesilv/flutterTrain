import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:koop/models/barberService.model.dart';

class BarberServicesView extends StatefulWidget {
  @override
  _BarberServicesViewState createState() => _BarberServicesViewState();
}

class _BarberServicesViewState extends State<BarberServicesView> {
  bool checkboxValue = false;
  List<BarberService> serviceList = fakeBarberServices;

  @override
  void initState() {
    // serviceList = getServiceList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: getServiceCategoryList(serviceList),
    );
  }
}



List<Widget> getServiceCategoryList(List<BarberService> serviceList) {
  List<Widget> serviceCategoryList = [];
  if (serviceList.length > 0) {
    List<BarberService> list = [];
    String currentServiceType = serviceList.first.serviceType;
    for (BarberService barberService in serviceList) {
      print(barberService.serviceName);
      if (barberService.serviceType == currentServiceType) {
        list.add(barberService);
      } else {
        serviceCategoryList.add(
          ServiceCategory(
            barberServiceList: list,
            serviceType: currentServiceType,
          ),
        );
        list = [barberService];
        currentServiceType = barberService.serviceType;
      }
    }
    if (list.length > 0) {
      serviceCategoryList.add(
        ServiceCategory(
          barberServiceList: list,
          serviceType: currentServiceType,
        ),
      );
    }
  }
  return serviceCategoryList;
}

class ServiceCategory extends StatelessWidget {
  final List<BarberService> barberServiceList;
  final String serviceType;

  ServiceCategory({this.serviceType, this.barberServiceList});

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          this.serviceType,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.04,
              fontWeight: FontWeight.bold),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => ServiceTile(
            barberService: barberServiceList[i],
          ),
          childCount: barberServiceList.length,
        ),
      ),
    );
  }
}

class ServiceTile extends StatefulWidget {
  final BarberService barberService;

  ServiceTile({this.barberService});

  @override
  _ServiceTileState createState() => _ServiceTileState();
}

class _ServiceTileState extends State<ServiceTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: this.widget.barberService.isSelected,
        onChanged: (bool newValue) {
          setState(() {
            this.widget.barberService.isSelected = newValue;
          });
        },
      ),
      title: Text(this.widget.barberService.serviceName),
      subtitle: Text('${this.widget.barberService.serviceDuration} min'),
      trailing: Text('${this.widget.barberService.servicePrice}€'),
    );
  }
}

List<BarberService> getServiceList() {
  return fakeBarberServices;
}
