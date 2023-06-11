class TherapyProblemModel {
  TherapyProblemModel({
    this.type,
    this.description,
    this.isTherapyProblem,
  });

  String? type;
  String? description;
  String? isTherapyProblem;

  TherapyProblemModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      type = json['type'];
      description = json['description'];
      isTherapyProblem = json['isTherapyProblem'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'description': description,
      'isTherapyProblem': isTherapyProblem,
    };
  }
}
