import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  DefaultTextField({
    Key? key,
    this.suffixIcon,
    this.prefixIcon,
    this.txtInputType,
    this.isEnabled,
    this.labelTxt,
    required this.hintTxt,
    required this.onTxtChange,
  }) : super(key: key);
  String hintTxt;
  String? labelTxt;
  bool? isEnabled;
  IconData? prefixIcon;
  IconData? suffixIcon;
  Function onTxtChange;
  TextInputType? txtInputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (val) {
        onTxtChange(val);
      },
      keyboardType: txtInputType,
      enabled: isEnabled,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: secondaryColor)),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornersRadiusConst),
        ),
        labelText: labelTxt,
        hintText: hintTxt,
        hintStyle: txtTheme(context).titleMedium!.copyWith(color: hintsClr),
      ),
      style: txtTheme(context)
          .titleMedium!
          .copyWith(color: hintsClr.withOpacity(1), fontFamily: Lora),
    );
  }
}
