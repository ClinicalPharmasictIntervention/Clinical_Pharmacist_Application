import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:flutter/material.dart';

class FakeLanding extends StatelessWidget {
  const FakeLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PrimaryBtn(
          btnTitle: 'Login',
          onPressed: () {
            print('clicked');
          },
        ),
      ),
    );
  }
}
