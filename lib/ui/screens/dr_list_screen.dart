import 'package:clinical_pharmacist_intervention/data/models/doctor_model.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/dr_options_item.dart';

import 'package:flutter/material.dart';

class DrDiscussionScreen extends StatelessWidget {
  const DrDiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 7,
                  child: DefaultTextField(
                    hintTxt: 'Search with physician name',
                    prefixIcon: IconBroken.Search,
                    onTxtChange: (text) {},
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        DoctorModel doctor = DoctorModel(
                            name: "Samer Othman",
                            department: "Orthopedics",
                            id: "2301so",
                            phoneNumber: "01011245647",
                            email: "dev.cs.mohamed@gmail.com");
                        return DrOptionsItem(
                          doctor: doctor,
                        );
                      },
                      itemCount: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
