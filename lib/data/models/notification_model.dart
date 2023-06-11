import 'package:flutter/material.dart';

class NotificationModel {
  NotificationModel({
    required this.physicianName,
    required this.patientName,
    required this.time,
    required this.date,
    required this.status,
    required this.type,
  });

  String? physicianName;
  String? patientName;
  String? time;
  String? date;
  String? status;
  String? type;

  NotificationModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      physicianName = json['physicianName'];
      patientName = json['patientName'];
      time = json['time'];
      date = json['date'];
      status = json['status'];
      type = json['type'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'physicianName': physicianName,
      'patientName': patientName,
      'time': time,
      'date': date,
      'status': status,
      'type': type,
    };
  }
}
