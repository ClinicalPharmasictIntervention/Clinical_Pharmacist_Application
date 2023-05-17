import 'package:clinical_pharmacist_intervention/main.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(60.0),
        child: Center(
          child: Text(
            'Special Home Screen In Progress',
            style: txtTheme(context).displaySmall!.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: Lora,
                ),
          ),
        ),
      ),
    );
  }
}
