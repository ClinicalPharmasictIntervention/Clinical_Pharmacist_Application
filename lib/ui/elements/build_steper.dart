import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/reports_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/make_report_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class BuildRepotSteper extends StatelessWidget {
  BuildRepotSteper({Key? key, required this.currentStep}) : super(key: key);
  int currentStep;

  int? selectedRadio1 = 0;
  int? selectedRadio2 = 0;
  int? selectedRadio3 = 0;

  TextEditingController? fieldController;
  int drugNumber = 1;

  List<String> drugs = [
    'Acetaminophen',
    'Acetylcysteine',
    'Actemra',
    'Actos',
    'Acyclovir',
    'Adderall',
    'Adderall XR',
    'Advair Diskus',
    'Advil',
    'Afinitor',
    'Aimovig',
    'Ajovy',
    'Albuterol',
    'Aldactone',
    'Alecensa',
    'Alendronate',
    'Glucotrol',
    'Glumetza',
    'Glutathione',
    'Glyburide',
    'Glycerin',
    'GlycoLax',
    'Glycopyrrolate',
    'Glyxambi',
    'Gocovri',
    'Modafinil',
    'Mometasone',
    'Montelukast',
    'Morphine',
    'Motrin',
  ];


  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: [
        buildOneStep(context, 0, "Resident", drawStep1Content(context)),
        buildOneStep(context, 1, "Problem", drawStep2Content(context)),
        buildOneStep(context, 2, "Intervention", drawStep3Content(context)),
      ],
      currentStep: currentStep,
      type: StepperType.horizontal,
      elevation: 0,
      onStepContinue: () {
        final isFinalStep = currentStep == 2;
        if (isFinalStep) {
          print('completed');
          drawQuickAlert(context);
        } else {
          ++currentStep;
        }
      },
      onStepCancel: currentStep == 0 ? null : () => --currentStep,
      onStepTapped: (step) => currentStep = step,
      controlsBuilder: (context, ControlsDetails controlDetail) {
        final isLastStep = controlDetail.currentStep == 2;
        return drawControllerBuilder(context, isLastStep, controlDetail);
      },
    );
  }

  drawStepTitle(BuildContext context, String stepTitle) {
    return Text(
      stepTitle,
      style: txtTheme(context).displaySmall!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            fontFamily: Lora,
          ),
    );
  }

  drawStep1Content(BuildContext context) {
    var cardTitles = [
      'Your Name',
      'Consultant Name',
      'Department',
      'Resident Name',
      'Bed Number',
      'Medical Record Number'
    ];
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        writeCard(
          context,
          cardTitles[0],
        ),
        const SizedBox(
          height: 20.0,
        ),
        writeCard(
          context,
          cardTitles[1],
        ),
        const SizedBox(
          height: 20.0,
        ),
        writeCard(
          context,
          cardTitles[2],
        ),
        const SizedBox(
          height: 20.0,
        ),
        writeCard(
          context,
          cardTitles[3],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: drawDefaultRadio(context, selectedRadio1, 0, 'Male', (value) {
                selectedRadio1 = value;
              }),
            ),
            Expanded(
              child:
                  drawDefaultRadio(context, selectedRadio1, 1, 'Female', (value) {
                selectedRadio1 = value;
              }),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        writeCard(
          context,
          cardTitles[4],
        ),
        const SizedBox(
          height: 20.0,
        ),
        writeCard(
          context,
          cardTitles[5],
        ),
      ],
    );
  }

  drawStep2Content(BuildContext context) {
    var cardTitles = [
      'Problem Type',
      'Problem Description',
      'Is this a drug therapy problem ?'
          'Error Category',
      'Error Description',
      'Stage and Type of error',
      'Is this problem also a medical error ?',
      'What\'s your reference?',
    ];
    return Column(
      children: [
        writeCard(
          context,
          cardTitles[0],
        ),
        const SizedBox(
          height: 20.0,
        ),
        writeCard(
          context,
          cardTitles[1],
        ),
        const SizedBox(
          height: 20.0,
        ),
        writeCard(
          context,
          cardTitles[2],
          readOnly: true,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: drawDefaultRadio(context, selectedRadio2, 0, 'Yes', (value) {
                selectedRadio2 = value;
              }),
            ),
            Expanded(
              child: drawDefaultRadio(context, selectedRadio2, 1, 'No', (value) {
                selectedRadio2 = value;
              }),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        writeCard(
          context,
          cardTitles[3],
        ),
        const SizedBox(
          height: 20.0,
        ),
        writeCard(
          context,
          cardTitles[4],
        ),
        const SizedBox(
          height: 20.0,
        ),
        writeCard(
          context,
          cardTitles[5],
        ),
        const SizedBox(
          height: 20.0,
        ),
        writeCard(
          context,
          cardTitles[6],
          readOnly: true,
          size: 16.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: drawDefaultRadio(context, selectedRadio3, 0, 'Yes', (value) {
                selectedRadio3 = value;
              }),
            ),
            Expanded(
              child: drawDefaultRadio(context, selectedRadio3, 1, 'No', (value) {
                selectedRadio3 = value;
              }),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        writeCard(
          context,
          cardTitles[7],
        ),
      ],
    );
  }

  drawStep3Content(BuildContext context) {
    var cardTitles = [
      'Write Your Intervention Here..',
    ];

    return Column(
      children: [
        writeCard(context, cardTitles[0]),
        const SizedBox(
          height: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: ListView.separated(
                itemBuilder: (context, index) => InterventionItem(
                  context,
                  drugs,
                  fieldController,
                  drugNumber,
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 40,
                ),
                itemCount: drugNumber,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  buildOneStep(BuildContext context, int currentStep, String stepTitle,
      Widget stepContent) {
    Step(
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= currentStep,
      title: drawStepTitle(context, stepTitle),
      content: stepContent,
    );
  }


  drawQuickAlert(BuildContext context) {
    QuickAlert.show(
      textColor: Colors.transparent,
      context: context,
      type: QuickAlertType.success,
      text: 'Transaction Completed Successfully!',
      showCancelBtn: true,
      confirmBtnText: 'Reports',
      cancelBtnText: 'Another',
      title: 'Your report is sent to physician, please wait for response...',
      onConfirmBtnTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReportsScreen()),
        );
      },
      onCancelBtnTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MakeReportScreen()),
        );
      },
    );
  }

  drawControllerBuilder(
      BuildContext context, bool isLastStep, ControlsDetails controlDetail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Row(
        children: [
          if (currentStep != 0)
            Expanded(
              child: PrimaryBtn(
                btnTitle: 'Back',
                onPressed: controlDetail.onStepCancel,
              ),
            ),
          if (currentStep != 0)
            const SizedBox(
              width: 10.0,
            ),
          Expanded(
            child: PrimaryBtn(
              btnTitle: isLastStep ? 'Confirm' : 'Next',
              onPressed: controlDetail.onStepContinue,
            ),
          )
        ],
      ),
    );
  }

Widget drawDefaultRadio(context, selectedRadio, value, lable, onChanged){
   return  RadioListTile(
      value: value,
      title: Text(
        lable,
        style: txtTheme(context).displaySmall!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              fontFamily: Lora,
            ),
      ),
      groupValue: selectedRadio,
      activeColor: secondaryColor,
      onChanged: onChanged,
    );
}
 


}
