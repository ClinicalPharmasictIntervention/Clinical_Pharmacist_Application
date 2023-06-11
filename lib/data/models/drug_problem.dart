import 'package:clinical_pharmacist_intervention/data/models/medication_error.dart';
import 'package:clinical_pharmacist_intervention/data/models/therapy_problem.dart';

class DrugProblemModel {
  DrugProblemModel({
    this.medicationError,
    this.therapyProblem,
  });

  MedicationErrorModel? medicationError;
  TherapyProblemModel? therapyProblem;

  DrugProblemModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      medicationError = json['medicationError'];
      therapyProblem = json['therapyProblem'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'medicationError': medicationError,
      'therapyProblem': therapyProblem,
    };
  }
}
