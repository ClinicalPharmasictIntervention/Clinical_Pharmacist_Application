import 'package:clinical_pharmacist_intervention/main.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  PrimaryBtn({Key? key, required this.btnTitle, required this.onPressed})
      : super(key: key);
  String btnTitle;
  Function onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornersRadiusConst),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          btnTitle,
          style: txtTheme(context).titleLarge!.copyWith(color: primaryColor),
        ),
      ),
    );
  }
}
