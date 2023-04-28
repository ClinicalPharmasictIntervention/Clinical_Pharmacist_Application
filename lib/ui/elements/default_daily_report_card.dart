import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_daily_report_card_content.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';

class DefaultDailyReportCard extends StatelessWidget {
  DefaultDailyReportCard({
    Key? key,
    required this.context,
    required this.residentName,
    required this.physicianName,
    required this.isProfile,
    this.time,
    this.date,
  }) : super(key: key);

  BuildContext context;
  String residentName;
  String physicianName;
  var time;
  var date;
  bool isProfile = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(3, 3),
            spreadRadius: 1,
            blurRadius: 10,
            color: Colors.grey,
          ),
        ],
        gradient: LinearGradient(
          colors: [secondaryColor, Colors.tealAccent, secondaryColor],
        ),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      width: 400,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DefaultDailyReportContent(
              context: context,
              label: 'Resident Name  ',
              title: '     $residentName',
            ),
            const SizedBox(
              height: 15.0,
            ),
            DefaultDailyReportContent(
              context: context,
              label: 'Physician Name',
              title: '     $physicianName',
            ),
            const SizedBox(
              height: 15.0,
            ),
            if (!isProfile)
              DefaultDailyReportContent(
                context: context,
                label: 'Intervention Time',
                title: ' $time',
              ),
            if (isProfile)
              DefaultDailyReportContent(
                context: context,
                label: 'Date',
                title: '                     $date',
              ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Show details..',
                    style: txtTheme(context).titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: Lora,
                      shadows: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: 50,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    IconBroken.Arrow___Up_2,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
