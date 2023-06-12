import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/report_screen_textfield.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/customPaints/arrow_down_painter.dart';
import 'package:cool_dropdown/enums/dropdown_align.dart';
import 'package:cool_dropdown/enums/dropdown_animation.dart';
import 'package:cool_dropdown/enums/dropdown_item_render.dart';
import 'package:cool_dropdown/enums/dropdown_triangle_align.dart';
import 'package:cool_dropdown/enums/result_render.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:cool_dropdown/options/dropdown_item_options.dart';
import 'package:cool_dropdown/options/dropdown_options.dart';
import 'package:cool_dropdown/options/dropdown_triangle_options.dart';
import 'package:flutter/material.dart';

import '../themes/constants.dart';

class ReportScreenItem extends StatelessWidget {
  ReportScreenItem({
    required this.context,
    required this.title,
    required this.readOnly,
    this.hintSize,
    this.keyboardType,
    this.controller,
    this.validate,
    this.onComplete,
    Key? key,
  }) : super(key: key);

  BuildContext context;
  String title;
  bool readOnly = false;
  double? hintSize = 20.0;
  var controller;
  var validate;
  var keyboardType;
  VoidCallback? onComplete;

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
        onComplete: onComplete,
      ),
    );
  }
}
