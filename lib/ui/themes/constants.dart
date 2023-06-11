import 'package:clinical_pharmacist_intervention/data/models/clinical_pharmacist_model.dart';
import 'package:clinical_pharmacist_intervention/data/models/doctor_model.dart';
import 'package:flutter/material.dart';

const cornersRadiusConst = 7.0;
const almarai = 'almarai';
const Lora = 'Lora';

String? token;
String? appToken;
String? ID;
Widget? startWidget;
Widget? homeOrRegisterWidget;
ClinicalPharmacistModel? pharmacistModel;
DoctorModel? physicians;

bool? isChat;
bool? isNotification;
