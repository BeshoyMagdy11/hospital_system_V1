import 'dart:io';

import 'package:hospital_system/models/patient_model.dart';

class Controller {
  final List<List<PatientModel>> patients = List.generate(21, (_) => []);

  void addPatient({
    required String name,
    required int status,
    required int specialization,
  }) {
    if (name.trim().isEmpty) throw Exception("Name can't be empty");
    if (status < 0 || status > 1) throw Exception("Status must be 0 or 1");
    if (specialization < 1 || specialization > 20) {
      throw Exception("Specialization must be between 1 and 20");
    }
    if (patients[specialization].length >= 5) {
      print("Can't add more patients in this specialization");
      return;
    }
    patients[specialization].add(PatientModel(name: name, status: status));
    patients[specialization].sort((a, b) => a.status.compareTo(b.status));
  }

  void showPatients() {
    if (patients.every((element) => element.isEmpty)) {
      print('no patients at the moment');
    }
    for (int i = 1; i < patients.length; i++) {
      if (patients[i].isNotEmpty) {
        print("there are ${patients[i].length} patients in Specialization $i");
        for (int j = 0; j < patients[i].length; j++) {
          print(
            'Specialization $i: Name is ${patients[i][j].name}, Status is ${patients[i][j].status}',
          );
        }
      }
    }
  }

  void getNextpatient({required int specialization}) {
    if (specialization < 1 || specialization > 20) {
      throw Exception("Specialization must be between 1 and 20");
    }
    if (patients[specialization].isEmpty) {
      print('no patients at the moment. have rest, Dr');
    } else {
      print(
        "${patients[specialization].removeAt(0).name} please come to the doctor room",
      );
    }
  }

  void start() {
    while (true) {
      print('1. Add new patient');
      print('2. Show all patients');
      print('3. Get next patient');
      print('4. Exit');

      int? choice = int.tryParse(stdin.readLineSync()!);

      if (choice == null) {
        print("Invalid input");
        continue;
      }

      if (choice == 4) {
        print("Goodbye!");
        break;
      }

      switch (choice) {
        case 1:
          print('Enter Patient Name:');
          String name = stdin.readLineSync()!;

          print('Enter Patient Status:');
          int status = int.parse(stdin.readLineSync()!);

          print('Enter Patient Specialization:');
          int specialization = int.parse(stdin.readLineSync()!);

          addPatient(
            name: name,
            status: status,
            specialization: specialization,
          );
          break;

        case 2:
          showPatients();
          break;

        case 3:
          print('Enter Patient Specialization:');
          int specialization = int.parse(stdin.readLineSync()!);

          getNextpatient(specialization: specialization);
          break;

        default:
          print('Invalid Choice');
      }
    }
  }
}
