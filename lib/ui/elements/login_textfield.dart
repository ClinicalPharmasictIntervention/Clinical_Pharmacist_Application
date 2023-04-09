import 'package:clinical_pharmacist_intervention/main.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField(
      {Key? key,
      required this.hintTxt,
      required this.prefixIcon,
      required this.onTxtChange})
      : super(key: key);
  String hintTxt;
  IconData prefixIcon;
  Function onTxtChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (val) {
        onTxtChange(val);
      },
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: secondaryColor)),
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornersRadiusConst),
        ),
        labelText: hintTxt,
        hintStyle: txtTheme(context).titleMedium!.copyWith(color: hintsClr),
      ),
      style: txtTheme(context)
          .titleMedium!
          .copyWith(color: hintsClr.withOpacity(1)),
    );
  }
}
