class DoctorModel {
  final String name;
  final String speciality;
  final int price;

  DoctorModel({
    required this.name,
    required this.speciality,
    required this.price,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(name: json['name'], speciality: json['speciality'], price: json['price']);
  }
}
