import 'package:flutter/material.dart';

class NotificationModel {
  NotificationModel({
    required this.clinicalPharmacistName,
    required this.patientName,
    required this.time,
    required this.date,
    required this.status,
    required this.type,
  });

  String clinicalPharmacistName;
  String patientName;
  String time;
  String date;
  String status;
  String type;
}
