class BarberService {
  int id;
  String serviceName;
  String serviceType;
  int serviceDuration;
  int servicePrice;
  bool isSelected;

  BarberService(this.id, this.serviceName, this.serviceType,
      this.serviceDuration, this.servicePrice,
      {this.isSelected = false});
}

List<BarberService> fakeBarberServices = [
  BarberService(0, 'Degrade', 'Cheveux', 40, 10),
  BarberService(1, 'Coupe au mulet', 'Cheveux', 20, 10),
  BarberService(2, 'degrade coupe ongle', 'Cheveux', 10, 12),
  BarberService(3, 'degrade degressif', 'Cheveux', 5, 4),
  BarberService(4, 'Degrade degradant', 'Cheveux', 2, 2),
  BarberService(5, 'Degrade a la Ahmed', 'Cheveux', 10, 50),
  BarberService(6, 'Teinture', 'Cheveux', 10, 50),
  BarberService(7, 'Lissage', 'Cheveux', 20, 70),
  BarberService(8, 'Trim', 'Barbe', 10, 5),
  BarberService(9, 'Krissi moustache', 'Barbe', 5, 4),
  BarberService(10, 'Jug bouc', 'Barbe', 1, 1),
  BarberService(11, 'epilation louche', 'Sourcils', 5, 4),
  BarberService(12, 'Mete sourcil', 'Sourcils', 120, 20),
];
