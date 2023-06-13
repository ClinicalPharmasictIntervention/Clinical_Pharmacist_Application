import 'package:flutter/material.dart';

class ProblemModel {
  ProblemModel({
    this.problemType,
    this.problemDesc,
    this.problemCategory,
    this.erorType,
  });

  String? problemType;
  String? problemDesc;
  String? problemCategory;

  String? erorType;

  ProblemModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      problemType = json['name'];
      problemDesc = json['id'];
      problemCategory = json['gender'];
      erorType = json['phoneNumber'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': problemType,
      'id': problemDesc,
      'gender': problemCategory,
      'phoneNumber': erorType,
    };
  }
}
