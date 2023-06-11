class MedicationErrorModel {
  MedicationErrorModel({
    this.category,
    this.description,
    this.type,
    this.isMedicalError,
  });

  String? category;
  String? type;
  String? description;
  String? isMedicalError;

  MedicationErrorModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      category = json['category'];
      type = json['type'];
      description = json['description'];
      isMedicalError = json['isMedicalError'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'type': type,
      'description': description,
      'isMedicalError': isMedicalError,
    };
  }
}
