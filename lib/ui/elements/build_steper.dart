import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/shared/cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_radio_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/report_screen_item.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/dr_list_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/layout_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/reports_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/make_report_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class BuildReportStepper extends StatelessWidget {
  BuildReportStepper({
    this.drAppToken,
    this.drId,
  });

  String? drAppToken;
  String? drId;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // TextEditingController nameController = TextEditingController();
  // TextEditingController consultantController = TextEditingController();
  // TextEditingController departController = TextEditingController();
  // TextEditingController residentNameController = TextEditingController();
  // TextEditingController ageController = TextEditingController();
  // TextEditingController bedController = TextEditingController();
  // TextEditingController medicalController = TextEditingController();
  // TextEditingController fieldController = TextEditingController();

  List<TextEditingController> controller = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 18; ++i) {
      controller.add(TextEditingController());
    }
    return BlocConsumer<ReportsCubit, ReportsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ReportsCubit.get(context);
        return BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit2 = AppCubit.get(context);
            return Form(
              key: formKey,
              child: Stepper(
                steps: [
                  buildOneStep(context, 0, "Resident",
                      drawStep1Content(context, cubit), cubit),
                  buildOneStep(context, 1, "Problem",
                      drawStep2Content(context, cubit), cubit),
                  buildOneStep(context, 2, "Recommend..",
                      drawStep3Content(context, cubit), cubit),
                ],
                currentStep: cubit.currentStep,
                type: StepperType.horizontal,
                elevation: 0,
                onStepContinue: () {
                  final isFinalStep = cubit.currentStep == 2;

                  if (isFinalStep) {
                    print('completed');

                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Center(
                                child: Text('Are you sure to send report?')),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: PrimaryBtn(
                                    btnTitle: 'Yes',
                                    onPressed: () {
                                      cubit2.sendNotificationData(
                                        physicianName:
                                            controller[0].text.toString(),
                                        patientName:
                                            controller[1].text.toString(),
                                        receiverId: drId,
                                        status: 'Pending',
                                      );
                                      sendNotify(
                                        title: 'Intervention Request',
                                        body: 'From pharmacist Ali',
                                        token: drAppToken,
                                      );

                                      showQuickAlert(
                                        context: context,
                                        alertType: QuickAlertType.success,
                                        dialogMessage:
                                            'Wait For Physician Acceptance',
                                        actionTitle:
                                            'Your Report Is Done Successfully!',
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
                            titleTextStyle:
                                txtTheme(context).headlineLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0,
                                      color: Colors.black87,
                                      fontFamily: Lora,
                                    ),
                          );
                        });
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

                  return drawControllerBuilder(
                      context, isLastStep, controlDetail);
                },
              ),
            );
          },
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
          controller: controller[2],
          validate: (value) {
            if (value.isEmpty) {
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
          controller: controller[3],
          validate: (value) {
            if (value.isEmpty) {
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
          controller: controller[4],
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
          controller: controller[5],
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
                controller: controller[6],
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
          title: cardTitles[4],
          readOnly: false,
          controller: controller[7],
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
          title: cardTitles[5],
          readOnly: false,
          controller: controller[8],
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
    var cardTitles = [
      'Problem Type',
      'Problem Description',
      'Error Category ( Severity )',
      'Stage and Type of The Error',
      'What\'s your reference?',
    ];
    return Column(
      children: [
        ReportScreenItem(
          context: context,
          title: cardTitles[0],
          readOnly: false,
          validate: (value) {
            if (value.isEmpty) {
              return 'Problem type is empty';
            } else {
              return null;
            }
          },
          controller: controller[9],
        ),
        const SizedBox(
          height: 40.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[1],
          readOnly: false,
          validate: (value) {
            if (value.isEmpty) {
              return 'Problem description is empty';
            } else {
              return null;
            }
          },
          controller: controller[10],
        ),
        const SizedBox(
          height: 40.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[2],
          readOnly: false,
          validate: (value) {
            if (value.isEmpty) {
              return 'Error category is empty';
            } else {
              return null;
            }
          },
          controller: controller[12],
        ),
        const SizedBox(
          height: 40.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[3],
          readOnly: false,
          validate: (value) {
            if (value.isEmpty) {
              return 'Stage and Type of The Error is empty';
            } else {
              return null;
            }
          },
          controller: controller[10],
        ),
        const SizedBox(
          height: 40.0,
        ),
        ReportScreenItem(
          context: context,
          title: cardTitles[4],
          readOnly: false,
          validate: (value) {
            if (value.isEmpty) {
              return 'reference is empty';
            } else {
              return null;
            }
          },
          controller: controller[15],
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
              return 'intervention is empty';
            } else {
              return null;
            }
          },
          controller: controller[16],
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
                  controller[17],
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
