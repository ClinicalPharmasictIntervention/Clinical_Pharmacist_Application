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
    this.drugProblem,
    this.intervention,
    this.resident,
    this.clinicalPharmacist,
    this.physician,
    this.reference,
  });
  DoctorModel? physician;
  ClinicalPharmacistModel? clinicalPharmacist;
  ResidentModel? resident;
  DrugProblemModel? drugProblem;
  String? reference;
  InterventionModel? intervention;
  String? id;
  String? date;
  String? time;

  ReportModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['id'];
      date = json['date'];
      time = json['time'];
      drugProblem = json['drugProblem'];
      intervention = json['intervention'];
      resident = json['resident'];
      clinicalPharmacist = json['clinicalPharmacist'];
      physician = json['physician'];
      reference = json['reference'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'time': time,
      'drugProblem': drugProblem,
      'intervention': intervention,
      'resident': resident,
      'clinicalPharmacist': clinicalPharmacist,
      'physician': physician,
      'reference': reference,
    };
  }
}
