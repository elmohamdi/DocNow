

import 'package:i_clinic/features/doctor_profile/data/models/doctor_model.dart';

abstract class DoctorProfileRepository {
  Future<DoctorModel?> getDoctorInfo(String id);
}
