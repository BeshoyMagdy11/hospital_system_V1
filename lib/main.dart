import 'package:hospital_system/controllers/controller.dart';

void main() {
  Controller controller = Controller();
  controller.addPatient(name: 'mostafa', status: 0, specialization: 15);
  controller.addPatient(name: 'omar', status: 1, specialization: 15);
  controller.addPatient(name: 'ahmed', status: 0, specialization: 15);
  controller.addPatient(name: 'mohamed', status: 1, specialization: 15);
  controller.addPatient(name: 'ali', status: 0, specialization: 10);
  controller.addPatient(name: 'hassan', status: 1, specialization: 10);
  controller.addPatient(name: 'sally', status: 0, specialization: 10);
  controller.addPatient(name: 'mona', status: 1, specialization: 10);
  controller.getNextpatient(specialization: 15);
  controller.getNextpatient(specialization: 15);
  controller.getNextpatient(specialization: 15);
  controller.getNextpatient(specialization: 15);
  controller.getNextpatient(specialization: 15);
}
