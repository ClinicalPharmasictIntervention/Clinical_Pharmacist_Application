import 'package:clinical_pharmacist_intervention/main.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(60.0),
        child: Text(
          'My Interventions',
          style: txtTheme(context).displaySmall!.copyWith(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
