import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/shared/cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_radio_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/report_screen_item.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/reports_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/make_report_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class BuildReportStepper extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController consultantController = TextEditingController();
  TextEditingController departController = TextEditingController();
  TextEditingController residentNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bedController = TextEditingController();
  TextEditingController medicalController = TextEditingController();
  TextEditingController fieldController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportsCubit, ReportsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ReportsCubit.get(context);
        return Form(
          key: formKey,
          child: Stepper(
            steps: [
              buildOneStep(context, 0, "Resident",
                  drawStep1Content(context, cubit), cubit),
              buildOneStep(context, 1, "Problem",
                  drawStep2Content(context, cubit), cubit),
              buildOneStep(context, 2, "Intervention",
                  drawStep3Content(context, cubit), cubit),
            ],
            currentStep: cubit.currentStep,
            type: StepperType.horizontal,
            elevation: 0,
            onStepContinue: () {
              final isFinalStep = cubit.currentStep == 2;
              if (isFinalStep) {
                print('completed');

                showQuickAlert(
                  context: context,
                  alertType: QuickAlertType.success,
                  dialogMessage: 'Wait For Physician Acceptance',
                  actionTitle: 'Your Report Is Done Successfully!',
                  nextButtonTitle: 'Reports',
                  backButtonTitle: 'Another',
                  onNext: () {
                    navigateTo(context, ReportsScreen());
                  },
                  onBack: () {
                    navigateTo(context, MakeReportScreen());
                  },
                );
              } else {
                cubit.changeForwardStep();
              }
            },
            onStepCancel: cubit.currentStep == 0
                ? null
                : () {
                    cubit.changeBackwardStep();
                  },
            onStepTapped: (step) {
              cubit.onTappedStep(step);
            },
            controlsBuilder: (context, ControlsDetails controlDetail) {
              final isLastStep = controlDetail.currentStep == 2;

              return drawControllerBuilder(context, isLastStep, controlDetail);
            },
          ),
        );
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

  // STEP NUMBER ONE
  drawStep1Content(BuildContext context, cubit) {
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
        ReportScreenItem(
          context: context,
          title: cardTitles[0],
          readOnly: false,
          controller: nameController,
          validate: (value) {
            if (nameController.text.isEmpty) {
              return 'Your name is empty';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[1],
          readOnly: false,
          controller: consultantController,
          validate: (value) {
            if (consultantController.text.isEmpty) {
              return 'Consultant name is empty';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[2],
          readOnly: false,
          controller: departController,
          validate: (value) {
            print('dsfs');
            if (value.isEmpty) {
              return 'Department name is empty';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[3],
          readOnly: false,
          controller: residentNameController,
          validate: (value) {
            if (residentNameController.text.isEmpty) {
              return 'Resident name is empty';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: DefaultRadioItem(
                context: context,
                selectedRadio: cubit.selectedRadio,
                value: 0,
                label: 'Male',
                activeColor: secondaryColor,
                onChanged: (value) {
                  cubit.changeFirstRadioMode(value);
                },
              ),
            ),
            SizedBox(
              width: 60,
              child: ReportScreenItem(
                context: context,
                title: 'Age',
                readOnly: false,
                hintSize: 17,
                controller: ageController,
                validate: (value) {
                  if (ageController.text.isEmpty) {
                    return 'Resident age is empty';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
              ),
            ),
            Expanded(
              child: DefaultRadioItem(
                context: context,
                selectedRadio: cubit.selectedRadio,
                value: 1,
                label: 'Female',
                activeColor: secondaryColor,
                onChanged: (value) {
                  cubit.changeFirstRadioMode(value);
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[4],
          readOnly: false,
          controller: bedController,
          validate: (value) {
            if (bedController.text.isEmpty) {
              return 'Bed number is empty';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 20.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[5],
          readOnly: false,
          controller: medicalController,
          validate: (value) {
            if (medicalController.text.isEmpty) {
              return 'Medical record number is empty';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  // STEP NUMBER TWO
  drawStep2Content(BuildContext context, cubit) {
    var cardTitles = [
      'Problem Type',
      'Problem Description',
      'Is this a drug therapy problem ?',
      'Error Category',
      'Error Description',
      'Stage and Type of error',
      'Is this problem also a medical error ?',
      'What\'s your reference?',
    ];
    return Column(
      children: [
        ReportScreenItem(
          context: context,
          title: cardTitles[0],
          readOnly: false,
        ),
        const SizedBox(
          height: 20.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[1],
          readOnly: false,
        ),
        const SizedBox(
          height: 20.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[2],
          readOnly: true,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: DefaultRadioItem(
                context: context,
                selectedRadio: cubit.selectedRadio1,
                value: 0,
                label: 'Yes',
                activeColor: secondaryColor,
                onChanged: (value) {
                  cubit.changeSecondRadioMode(value);
                },
              ),
            ),
            Expanded(
              child: DefaultRadioItem(
                context: context,
                selectedRadio: cubit.selectedRadio1,
                value: 1,
                label: 'No',
                activeColor: secondaryColor,
                onChanged: (value) {
                  cubit.changeSecondRadioMode(value);
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[3],
          readOnly: false,
        ),
        const SizedBox(
          height: 20.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[4],
          readOnly: false,
        ),
        const SizedBox(
          height: 20.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[5],
          readOnly: false,
        ),
        const SizedBox(
          height: 20.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[6],
          readOnly: true,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: DefaultRadioItem(
                context: context,
                selectedRadio: cubit.selectedRadio2,
                value: 0,
                label: 'Yes',
                activeColor: secondaryColor,
                onChanged: (value) {
                  cubit.changeThirdRadioMode(value);
                },
              ),
            ),
            Expanded(
              child: DefaultRadioItem(
                context: context,
                selectedRadio: cubit.selectedRadio2,
                value: 1,
                label: 'No',
                activeColor: secondaryColor,
                onChanged: (value) {
                  cubit.changeThirdRadioMode(value);
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[7],
          readOnly: false,
        ),
      ],
    );
  }

  //STEP NUMBER THREE
  drawStep3Content(BuildContext context, cubit) {
    var cardTitles = [
      'Write Your Intervention Here..',
    ];

    return Column(
      children: [
        ReportScreenItem(
          context: context,
          title: cardTitles[0],
          readOnly: false,
        ),
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
                  cubit.drugs,
                  fieldController,
                  cubit,
                  cubit.drugNumber,
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 40,
                ),
                itemCount: cubit.drugNumber,
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
      Widget stepContent, cubit) {
    if (currentStep == 2) {
      drawFloatingActionButton(currentStep, cubit);
    }
    return Step(
      state: cubit.currentStep > currentStep
          ? StepState.complete
          : StepState.indexed,
      isActive: cubit.currentStep >= currentStep,
      title: drawStepTitle(context, stepTitle),
      content: stepContent,
    );
  }

  drawControllerBuilder(
      BuildContext context, bool isLastStep, ControlsDetails controlDetail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Row(
        children: [
          if (controlDetail.currentStep != 0)
            Expanded(
              child: PrimaryBtn(
                btnTitle: 'Back',
                onPressed: controlDetail.onStepCancel,
              ),
            ),
          if (controlDetail.currentStep != 0)
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
}
