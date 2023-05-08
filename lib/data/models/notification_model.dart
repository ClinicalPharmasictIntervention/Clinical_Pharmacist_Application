import 'package:flutter/material.dart';

class NotificationModel {
  NotificationModel({
    required this.doctorName,
    required this.patientName,
    required this.time,
    required this.date,
    required this.status,
    required this.type,
  });

  String doctorName;
  String patientName;
  String time;
  String date;
  String status;
  String type;
}
