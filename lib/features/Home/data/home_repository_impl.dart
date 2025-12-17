import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_clinic/features/Home/data/models/doctor_model.dart';
import 'package:i_clinic/features/Home/domain/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<DoctorModel>> getDoctors() async {
    
    final query = await firestore
        .collection('users')
        .where('type', isEqualTo: 'doctor')
        .get();

    List<DoctorModel> doctors = [];

    for (var userDoc in query.docs) {
      final userData = userDoc.data();

      final details = await firestore
          .collection('users')
          .doc(userDoc.id)
          .collection('details')
          .get();

      if (details.docs.isEmpty) continue;

      final detailsData = details.docs.first.data();

      doctors.add(
        DoctorModel(
          id: userData['uid'],
          name: userData['name'],
          speciality: detailsData['speciality'],
          price: (detailsData['price'] as num).toInt(),
        ),
      );
    }

    return doctors;
  }
}
