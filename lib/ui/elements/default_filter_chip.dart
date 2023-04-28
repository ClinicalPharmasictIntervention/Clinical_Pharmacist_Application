import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';

class DefaultFilterChip extends StatelessWidget {
  DefaultFilterChip({
    Key? key,
    required this.context,
    required this.title,
    required this.color,
    required this.onSelected,
    this.icon,
  }) : super(key: key);

  BuildContext context;
  String title;
  IconData? icon;
  var color;
  var onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        title,
        style: txtTheme(context).titleMedium!.copyWith(
          fontFamily: Lora,
          color: Colors.white,
          fontWeight: FontWeight.bold,
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
      onSelected: onSelected,
      backgroundColor: color,
      elevation: 3.0,
      avatar: Icon(icon),
    );
  }
}
