import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';

class ReportDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        secondaryColor.withOpacity(0.5),
                        Colors.tealAccent.withOpacity(0.3),
                        secondaryColor.withOpacity(0.5),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Report 1',
                      style: txtTheme(context).headlineLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 35.0,
                        color: Colors.white,
                        fontFamily: Lora,
                        shadows: [
                          BoxShadow(
                            color: accentColor,
                            blurRadius: 10,
                            spreadRadius: 20,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(IconBroken.Arrow___Down_2,
                  color: Colors.black87, size: 30),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black87),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Name: Marwa Alaa Abd El-Shakoor',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Consultant Name: Mohamed Ahmed Abd El-Hakeem',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Physician Name: Mohamed Ahmed Abd El-Hakeem',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Report Date: 2021(07) July',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Department: ward',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black87),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Resident Information',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Name: Ali Ahmed Abd El-Hakeem',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Gender: Male',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Age: 65',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Medical Record Number: 34725',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Bed Number: 599',
                          style: textTheme(context),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black87),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Problem',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Problem Type: [Monitoring]',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Problem Description:  (1.4) Indication (medical condition) without medication',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Is this a drug therapy problem ?: Yes',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Error Category: none',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Error Description: none',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Stage and Type of error: none',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Is tis problem also a medical error ?: No',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'What\'s your reference ?: lexicomp',
                          style: textTheme(context),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black87),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Your Intervention : pt tolerate oral intake dc background fluid',
                      style: textTheme(context),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black87),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Drug Doses',
                          style: textTheme(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Drug1: lexicomp',
                          style: textTheme(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Your Dose: 25',
                              style: textTheme(context),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Expanded(
                              child: Text(
                                'Physician Dose: 50',
                                style: textTheme(context),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Drug2: concor',
                          style: textTheme(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Your Dose: 3',
                              style: textTheme(context),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Expanded(
                              child: Text(
                                'Physician Dose: 1',
                                style: textTheme(context),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black87),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Physician Acceptance: Accepted',
                      style: textTheme(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle textTheme(context) => txtTheme(context).displaySmall!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.white,
      fontFamily: Lora,
      shadows: [
        BoxShadow(
          color: Colors.black87,
          blurRadius: 6,
          spreadRadius: 9,
          offset: Offset(0, 0),
        ),
      ],
    );
