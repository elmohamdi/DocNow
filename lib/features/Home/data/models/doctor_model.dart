class DoctorModel {
  final String id;
  final String name;
  final String speciality;
  final int price;

  DoctorModel({
    required this.id,
    required this.name,
    required this.speciality,
    required this.price,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['uid'],
      name: json['name'],
      speciality: json['speciality'],
      price: json['price'],
    );
  }
}
