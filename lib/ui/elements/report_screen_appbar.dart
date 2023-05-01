import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:flutter/material.dart';

import '../themes/constants.dart';

class BuildReportScreenAppBarTitle extends StatelessWidget {
  BuildReportScreenAppBarTitle(
      {Key? key,
      required this.context,
      required this.titleText,
      required this.icon})
      : super(key: key);
  BuildContext context;
  String titleText;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        children: [
          Icon(
            size: 30,
            icon,
            color: Colors.black87,
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            titleText,
            style: txtTheme(context).headlineLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                  fontFamily: Lora,
                  color: Colors.black87,
                ),
          ),
        ],
      ),
    );
  }
}



class BuildReportScreenAppBarLeading extends StatelessWidget {
  const BuildReportScreenAppBarLeading(
      {Key? key, 
     }):
     super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return IconButton(
            icon: const Icon(
              IconBroken.Arrow___Left_2,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          );
  }
}
