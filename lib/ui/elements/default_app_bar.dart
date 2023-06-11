import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends AppBar {
  DefaultAppBar({
    Key? key,
    required this.text,
  });

  String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 0,
      title: Row(
        children: [
          const Icon(
            size: 30,
            IconBroken.Document,
            color: Colors.black87,
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            text,
            style: txtTheme(context).headlineLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                  color: Colors.black87,
                  fontFamily: Lora,
                ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }
}
