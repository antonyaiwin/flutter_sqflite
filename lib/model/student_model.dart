class StudentModel {
  int id;
  String name;
  int phoneNumber;

  StudentModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  factory StudentModel.fromMap(Map<String, dynamic> json) => StudentModel(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "phoneNumber": phoneNumber,
      };
}
