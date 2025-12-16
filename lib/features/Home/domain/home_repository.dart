import 'package:i_clinic/features/Home/data/models/doctor_model.dart';

abstract class HomeRepository {
  Future<List<DoctorModel>> getDoctors();
}
