class ClinicalPharmacistModel {
  ClinicalPharmacistModel({
    this.name,
    this.id,
    this.hospitalId,
    this.phoneNumber,
    this.email,
    this.appToken,
  });

  String? name;
  String? id;
  String? hospitalId;
  String? phoneNumber;
  String? email;
  String? appToken;

  ClinicalPharmacistModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      name = json['name'];
      id = json['id'];
      hospitalId = json['hospitalId'];
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
      'phoneNumber': phoneNumber,
      'email': email,
      'appToken': appToken,
    };
  }
}
