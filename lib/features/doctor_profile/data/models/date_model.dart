

class DateModel {
  final String day;
  final int from;
  final int to;

  DateModel({
    required this.day,
    required this.from,
    required this.to,
  });

  factory DateModel.fromMap(Map<String, dynamic> map) {
    return DateModel(
      day: map['day'] ?? '',
      from: map['from'] ?? '',
      to: map['to'] ?? '',
    );
  }
}
