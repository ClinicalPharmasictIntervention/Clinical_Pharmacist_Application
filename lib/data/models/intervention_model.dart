import 'package:clinical_pharmacist_intervention/data/models/drug_model.dart';

class InterventionModel {
  InterventionModel({
    this.content,
    this.status,
    this.clinicalPharmacistDose,
    this.physicianDose,
  });

  String? content;
  String? status;
  DrugModel? drug;
  int? clinicalPharmacistDose;
  int? physicianDose;

  InterventionModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      content = json['content'];
      status = json['status'];
      clinicalPharmacistDose = json['clinicalPharmacistDose'];
      physicianDose = json['physicianDose'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'status': status,
      'clinicalPharmacistDose': clinicalPharmacistDose,
      'physicianDose': physicianDose,
    };
  }
}
