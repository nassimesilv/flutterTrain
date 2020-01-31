import 'package:flutter/material.dart';

class BarberServiceModel {
  String serviceId;
  String serviceName;
  String serviceType;
  int serviceDuration;
  int servicePrice;
  bool isSelected;

  BarberServiceModel(
      {@required this.serviceId,
      this.serviceName,
      this.serviceType,
      this.serviceDuration,
      this.servicePrice,
      this.isSelected = false});
}

List<BarberServiceModel> fakeBarberServiceModels = [
  BarberServiceModel(serviceId: '0', serviceName: 'Degrade', serviceType: 'Cheveux', serviceDuration: 40, servicePrice: 10),
  BarberServiceModel(serviceId: '1', serviceName: 'Coupe au mulet', serviceType: 'Cheveux', serviceDuration: 20, servicePrice: 10),
  BarberServiceModel(serviceId: '2', serviceName: 'degrade coupe ongle', serviceType: 'Cheveux', serviceDuration: 10, servicePrice: 12),
  BarberServiceModel(serviceId: '3', serviceName: 'degrade degressif', serviceType: 'Cheveux', serviceDuration: 5, servicePrice: 4),
  BarberServiceModel(serviceId: '4', serviceName: 'Degrade degradant', serviceType: 'Cheveux', serviceDuration: 2, servicePrice: 2),
  BarberServiceModel(serviceId: '5', serviceName: 'Degrade a la Ahmed', serviceType: 'Cheveux', serviceDuration: 10, servicePrice: 50),
  BarberServiceModel(serviceId: '6', serviceName: 'Teinture', serviceType: 'Cheveux', serviceDuration: 10, servicePrice: 50),
  BarberServiceModel(serviceId: '7', serviceName: 'Lissage', serviceType: 'Cheveux', serviceDuration: 20, servicePrice: 70),
  BarberServiceModel(serviceId: '8', serviceName: 'Trim', serviceType: 'Barbe', serviceDuration: 10, servicePrice: 5),
  BarberServiceModel(serviceId: '9', serviceName: 'Krissi moustache', serviceType: 'Barbe', serviceDuration: 5, servicePrice: 4),
  BarberServiceModel(serviceId: '10', serviceName: 'Jug bouc', serviceType: 'Barbe', serviceDuration: 1, servicePrice: 1),
  BarberServiceModel(serviceId: '11', serviceName: 'epilation louche', serviceType: 'Sourcils', serviceDuration: 5, servicePrice: 4),
  BarberServiceModel(serviceId: '12', serviceName: 'Mete sourcil', serviceType: 'Sourcils',serviceDuration:  120, servicePrice: 20),
];
