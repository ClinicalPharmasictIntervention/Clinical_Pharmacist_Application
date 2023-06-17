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
      name = json['userName'];
      id = json['_id'];
      hospitalId = json['hospitalId'].toString();
      department = json['department'];
      phoneNumber = json['phoneNumber'].toString();
      email = json['email'];
      appToken = json['appToken'];
    }
  }



}
