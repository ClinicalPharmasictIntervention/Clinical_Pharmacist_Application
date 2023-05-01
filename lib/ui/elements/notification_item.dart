import 'package:clinical_pharmacist_intervention/data/models/notification_model.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/report_details_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NotificationItem extends StatelessWidget {
  NotificationItem({super.key, required this.notification});

  NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showMaterialModalBottomSheet(
        context: context,
        builder: (context) => ReportDetailsScreen(),
      ),
      child: Column(
        children: [
          ListTile(
            leading: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                    "assets/images/notification_${notification.type}.png")),
            title: Text(notification.clinicalPharmacistName),
            subtitle: Text(notification.patientName),
            isThreeLine: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(notification.date),
             // const SizedBox(width: 2),
              Text(notification.time),
              Text(notification.status),
            ],
          ),
          const Divider(
            thickness: 2.0,
          )
        ],
      ),
    );
  }
}
