import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_radio_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/report_screen_item.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/dr_list_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/layout_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/make_report_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';

class BuildReportStepper extends StatelessWidget {
  BuildReportStepper({
    this.drAppToken,
    this.drId,
    this.reportsCubit,
  });

  String? drAppToken;
  String? drId;
  ReportsCubit? reportsCubit;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Stepper(
        steps: [
          buildOneStep(context, 0, "Resident",
              drawStep1Content(context, reportsCubit), reportsCubit),
          buildOneStep(context, 1, "Problem",
              drawStep2Content(context, reportsCubit), reportsCubit),
          buildOneStep(context, 2, "Recommend..",
              drawStep3Content(context, reportsCubit), reportsCubit),
        ],
        currentStep: reportsCubit!.currentStep,
        type: StepperType.horizontal,
        elevation: 0,
        onStepContinue: onStepContinue(context),
        onStepCancel: onStepCancel(),
        onStepTapped: onStepTapped(reportsCubit!.currentStep),
        controlsBuilder: (context, ControlsDetails controlDetail) {
          final isLastStep = controlDetail.currentStep == 2;

          return drawControllerBuilder(context, isLastStep, controlDetail);
        },
      ),
    );
  }



  // STEP NUMBER ONE
  drawStep1Content(BuildContext context, cubit) {
    return Column(
      children: [
        ReportScreenItem(
          context: context,
          title: 'Resident Name',
          readOnly: false,
          controller: reportsCubit!.residentNameController,
          validate: (value) {
            if (value.isEmpty) {
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
                controller: reportsCubit!.ageController,
                validate: (value) {
                  if (value.isEmpty) {
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
          title: 'Bed Number',
          readOnly: false,
          controller: reportsCubit!.bedController,
          validate: (value) {
            if (value.isEmpty) {
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
          title: 'Medical Record Number',
          readOnly: false,
          controller: reportsCubit!.medicalController,
          validate: (value) {
            if (value.isEmpty) {
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
  
    return Column(
      children: [
        ReportScreenItem(
          context: context,
          title: 'Problem Type',
          readOnly: false,
          validate: (value) {
            if (value.isEmpty) {
              return 'Problem type is empty';
            } else {
              return null;
            }
          },
          controller: reportsCubit!.problemTypeController,
        ),
        const SizedBox(
          height: 40.0,
        ),
        ReportScreenItem(
          context: context,
          title: 'Problem Description',
          readOnly: false,
          validate: (value) {
            if (value.isEmpty) {
              return 'Problem description is empty';
            } else {
              return null;
            }
          },
          controller: reportsCubit!.problemDescController,
        ),
        const SizedBox(
          height: 40.0,
        ),
        ReportScreenItem(
          context: context,
          title: 'Error Category ( Severity )',
          readOnly: false,
          validate: (value) {
            if (value.isEmpty) {
              return 'Error category is empty';
            } else {
              return null;
            }
          },
          controller: reportsCubit!.erroCategoryController,
        ),
        const SizedBox(
          height: 40.0,
        ),
        ReportScreenItem(
          context: context,
          title: 'Stage and Type of The Error',
          readOnly: false,
          validate: (value) {
            if (value.isEmpty) {
              return 'Stage and Type of The Error is empty';
            } else {
              return null;
            }
          },
          controller: reportsCubit!.errorTypeController,
        ),
        const SizedBox(
          height: 40.0,
        ),
        ReportScreenItem(
          context: context,
          title: 'What\'s your reference?',
          readOnly: false,
          validate: (value) {
            if (value.isEmpty) {
              return 'reference is empty';
            } else {
              return null;
            }
          },
          controller: reportsCubit!.refrencesController,
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
          validate: (value) {
            if (value.isEmpty) {
              return 'Write Your Intervention Here..';
            } else {
              return null;
            }
          },
          controller:reportsCubit!.interventionController,
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
                  null,
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

  onStepContinue(BuildContext context) {
    final isFinalStep = reportsCubit!.currentStep == 2;

    if (isFinalStep) {
      print('completed');

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(child: Text('Are you sure to send report?')),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: PrimaryBtn(
                      btnTitle: 'No',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: PrimaryBtn(
                      btnTitle: 'Yes',
                      onPressed: () {
                        /*
                              reportsCubit!.sendNotificationData(
                              //  physicianName: controller[0].text.toString(),
                              //  patientName: controller[1].text.toString(),
                                receiverId: drId,
                                status: 'Pending',
                              );

                              */
                        sendNotify(
                          title: 'Intervention Request',
                          body: 'From pharmacist Ali',
                          token: drAppToken,
                        );

                        showQuickAlert(
                          context: context,
                          alertType: QuickAlertType.success,
                          dialogMessage: 'Wait For Physician Acceptance',
                          actionTitle: 'Your Report Is Done Successfully!',
                          nextButtonTitle: 'Reports',
                          backButtonTitle: 'Another',
                          onNext: () {
                            navigateTo(context, LayoutScreen());
                          },
                          onBack: () {
                            navigateTo(
                                context,
                                DrDiscussionScreen(
                                    isReportScreen: true,
                                    drAppToken: drAppToken));
                          },
                        );
                      }),
                ),
              ],
              backgroundColor: defaultColor,
              titleTextStyle: txtTheme(context).headlineLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: Colors.black87,
                    fontFamily: Lora,
                  ),
            );
          });
    } else {
      reportsCubit!.changeForwardStep();
    }
  }

  onStepCancel() {
    return reportsCubit!.currentStep == 0
        ? null
        : () {
            reportsCubit!.changeBackwardStep();
          };
  }

  onStepTapped(step) {
    reportsCubit!.onTappedStep(step);
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
}
