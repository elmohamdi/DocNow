import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_clinic/features/doctor_profile/data/models/date_model.dart';
import 'package:i_clinic/features/doctor_profile/data/models/doctor_model.dart';
import 'package:i_clinic/features/doctor_profile/domain/doctor_profile_repository.dart';

class DoctorProfileRepositoryImpl extends DoctorProfileRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<DoctorModel?> getDoctorInfo(String id) async {
    try {
      final userDoc = await firestore.collection('users').doc(id).get();

      if (!userDoc.exists) return null;

      final userData = userDoc.data()!;
      final name = userData['name'] ?? '';

      final details = await firestore
          .collection('users')
          .doc(id)
          .collection('details')
          .get();

      if (details.docs.isEmpty) return null;

      final datesQuery = await firestore
        .collection('users')
        .doc(id)
        .collection('dates')
        .get();

      final List<DateModel> dates = datesQuery.docs
      .map((doc) => DateModel.fromMap(doc.data()))
      .toList();

      final detailsData = details.docs.first.data();
      final specialty = detailsData['speciality'] ?? '';
      final price = detailsData['price'] ?? 0;
      final experience = detailsData['experience'] ?? 0;
      final clinic = detailsData['clinic_name'] ?? '';
      final address = detailsData['address'] ?? '';

      final doctor = DoctorModel(
        id: id,
        name: name,
        speciality: specialty,
        price: price,
        experience: experience,
        clinic: clinic,
        address: address,
        dates: dates,
      );

      return doctor;
    } catch (e) {
      print('Error fetching doctor info: $e');
      return null;
    }
  }
}
