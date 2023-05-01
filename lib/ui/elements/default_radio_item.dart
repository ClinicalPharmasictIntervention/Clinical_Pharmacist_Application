import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';

class DefaultRadioItem extends StatelessWidget {
  DefaultRadioItem({
    required this.context,
    required this.value,
    required this.label,
    required this.selectedRadio,
    required this.activeColor,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  BuildContext context;
  int value;
  int selectedRadio;
  String label;
  var activeColor;
  var onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      title: Text(
        label,
        style: txtTheme(context).displaySmall!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              fontFamily: Lora,
            ),
      ),
      groupValue: selectedRadio,
      activeColor: activeColor,
      onChanged: onChanged,
    );
  }
}
