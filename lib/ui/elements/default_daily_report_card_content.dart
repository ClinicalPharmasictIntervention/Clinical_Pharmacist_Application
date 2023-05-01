import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';

class DefaultDailyReportContent extends StatelessWidget {
  DefaultDailyReportContent({
    Key? key,
    required this.context,
    required this.title,
    required this.label,
  }) : super(key: key);

  BuildContext context;
  String label;
  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${label}       ',
          style: txtTheme(context).titleMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: Lora,
            shadows: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(3, 3),
                blurRadius: 10,
                spreadRadius: 50,
              ),
            ],
          ),
        ),
        Text(
          '${title}',
          style: txtTheme(context).titleMedium!.copyWith(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontFamily: Lora,
            shadows: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(5, 5),
                blurRadius: 50,
                spreadRadius: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
