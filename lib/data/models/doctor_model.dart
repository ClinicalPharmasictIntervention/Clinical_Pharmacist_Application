class DoctorModel {
  DoctorModel({
    this.name,
    this.department,
    this.id,
    this.hospitalId,
    this.phoneNumber,
    this.email,
    this.appToken,
  });

  String? name;
  String? department;
  String? hospitalId;
  String? id;
  String? phoneNumber;
  String? email;
  String? appToken;

  DoctorModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      name = json['name'];
      id = json['id'];
      hospitalId = json['hospitalId'];
      department = json['department'];
      phoneNumber = json['phoneNumber'];
      email = json['email'];
      appToken = json['appToken'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'hospitalId': hospitalId,
      'department': department,
      'phoneNumber': phoneNumber,
      'email': email,
      'appToken': appToken,
    };
  }
}
