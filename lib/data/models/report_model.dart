import 'package:clinical_pharmacist_intervention/data/models/clinical_pharmacist_model.dart';
import 'package:clinical_pharmacist_intervention/data/models/doctor_model.dart';
import 'package:clinical_pharmacist_intervention/data/models/drug_model.dart';
import 'package:clinical_pharmacist_intervention/data/models/drug_problem.dart';
import 'package:clinical_pharmacist_intervention/data/models/intervention_model.dart';
import 'package:clinical_pharmacist_intervention/data/models/resident_model.dart';

class ReportModel {
  ReportModel({
    this.id,
    this.date,
    this.time,
    this.drug,
    this.drugProblem,
    this.intervention,
    this.resident,
    this.clinicalPharmacist,
    this.physician,
    this.department,
    this.reference,
  });

  DrugModel? drug;
  DrugProblemModel? drugProblem;
  InterventionModel? intervention;
  String? id;
  String? date;
  String? time;
  ResidentModel? resident;
  ClinicalPharmacistModel? clinicalPharmacist;
  DoctorModel? physician;
  String? department;
  String? reference;

  ReportModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['id'];
      date = json['date'];
      time = json['time'];
      drug = json['drug'];
      drugProblem = json['drugProblem'];
      intervention = json['intervention'];
      resident = json['resident'];
      clinicalPharmacist = json['clinicalPharmacist'];
      physician = json['physician'];
      department = json['department'];
      reference = json['reference'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'time': time,
      'drug': drug,
      'drugProblem': drugProblem,
      'intervention': intervention,
      'resident': resident,
      'clinicalPharmacist': clinicalPharmacist,
      'physician': physician,
      'department': department,
      'reference': reference,
    };
  }
}
