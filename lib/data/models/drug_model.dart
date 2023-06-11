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
      id = json['id'];
      genericName = json['genericName'];
      brandName = json['brandName'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'genericName': genericName,
      'brandName': brandName,
    };
  }
}
