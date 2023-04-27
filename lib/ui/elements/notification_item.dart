import 'package:clinical_pharmacist_intervention/ui/screens/report_details_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showMaterialModalBottomSheet(
        context: context,
        builder: (context) => ReportDetailsScreen(),
      ),
      child: Column(
        children: [
          Container(
            /*
  decoration: BoxDecoration(
        boxShadow:const [
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
        ),
*/

            child: ListTile(
              leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                      "assets/images/notification_recommendation.png")),
              title: const Text("From"),
              subtitle: const Text("about"),
              isThreeLine: false,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text(DateTime.now().toString()), Text("need action")],
          ),
          Divider(
            thickness: 2.0,
          )
        ],
      ),
    );
  }
}
