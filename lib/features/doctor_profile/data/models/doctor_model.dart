import 'package:i_clinic/features/doctor_profile/data/models/date_model.dart';

class DoctorModel {
  final String id;
  final String name;
  final int price;
  final String speciality;
  final int experience;
  final String clinic;
  final String address;
  final List<DateModel> dates;

  DoctorModel({
    required this.id,
    required this.name,
    required this.price,
    required this.speciality,
    required this.experience,
    required this.clinic,
    required this.address,
    required this.dates,
  });
}
