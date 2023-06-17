class DrugModel {
  DrugModel({
    this.id,
    this.brandName,
    this.genericName,
  });

  String? id;
  String? genericName;
  String? brandName;

  DrugModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['_id'];
      brandName = json['drugName'];
    }
  }


}
