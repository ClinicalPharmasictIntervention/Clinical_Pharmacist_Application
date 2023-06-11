import 'package:flutter/material.dart';

class ResidentModel {
  ResidentModel({
    this.name,
    this.id,
    this.phoneNumber,
    this.age,
    this.gender,
    this.medicalRecordNumber,
    this.bedNumber,
  });

  String? name;
  String? id;
  String? gender;
  String? phoneNumber;
  int? age;
  int? medicalRecordNumber;
  int? bedNumber;

  ResidentModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      name = json['name'];
      id = json['id'];
      gender = json['gender'];
      phoneNumber = json['phoneNumber'];
      age = json['age'];
      medicalRecordNumber = json['medicalRecordNumber'];
      bedNumber = json['bedNumber'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'age': age,
      'medicalRecordNumber': medicalRecordNumber,
      'bedNumber': bedNumber,
    };
  }
}
