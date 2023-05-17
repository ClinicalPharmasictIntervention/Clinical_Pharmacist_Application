import 'package:clinical_pharmacist_intervention/ui/elements/report_screen_textfield.dart';
import 'package:flutter/material.dart';

class ReportScreenItem extends StatelessWidget {
  ReportScreenItem({
    required this.context,
    required this.title,
    required this.readOnly,
    this.hintSize,
    this.keyboardType,
    this.controller,
    this.validate,
    Key? key,
  }) : super(key: key);

  BuildContext context;
  String title;
  bool readOnly = false;
  double? hintSize = 20.0;
  var controller;
  var validate;
  var keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xffc1ddeb),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ReportScreenTextField(
        controller: controller,
        validate: validate,
        keyboardType: keyboardType,
        title: title,
        readOnly: readOnly,
        hintSize: hintSize,
      ),
    );
  }
}
