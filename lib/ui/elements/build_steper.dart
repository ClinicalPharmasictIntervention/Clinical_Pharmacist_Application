import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/reports_cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/reports_states.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_stepe_dropdown_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_radio_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/report_screen_item.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/dr_list_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/layout_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/make_report_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';

class BuildReportStepper extends StatefulWidget {
  BuildReportStepper({
    this.drAppToken,
    this.drId,
    this.reportsCubit,
  });

  String? drAppToken;
  String? drId;
  ReportsCubit? reportsCubit;

  @override
  State<BuildReportStepper> createState() => _BuildReportStepperState();
}

class _BuildReportStepperState extends State<BuildReportStepper> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

 
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportsCubit, ReportsStates>(
        listener: (context, state) {
    
      
      /*else if (state is FillProblemTypeState) {
        problemTypess = state.problemTypes;
        print("object");
        print(problemTypess.toString());
      } 
      
      else if (state is GeterrorCategoryState) {
        errorCategory = state.errorCategory;
        printToast(errorCategory);
      } else if (state is GetErrorTypeState) {
        errorTypes = state.errorTypes;
        printToast(errorTypes);
      }


      */
    }, builder: (context, state) {
      return Form(
        key: formKey,
        child: Stepper(
          steps: [
            buildOneStep(
                context,
                0,
                "Resident",
                drawStep1Content(context, widget.reportsCubit),
                widget.reportsCubit!),
            buildOneStep(context, 1, "Problem", drawStep2Content(context,widget.reportsCubit!),
                widget.reportsCubit!),
            buildOneStep(
                context,
                2,
                "Recommend..",
                drawStep3Content(context, widget.reportsCubit),
                widget.reportsCubit!),
          ],
          currentStep: widget.reportsCubit!.currentStep,
          type: StepperType.horizontal,
          elevation: 0,
          onStepContinue: onStepContinue(context),
          onStepCancel: onStepCancel(),
          onStepTapped: (newStep) {
            onStepTappped(newStep);
            widget.reportsCubit!.changeCurrentStep(newStep);
          },
          controlsBuilder: (context, ControlsDetails controlDetail) {
            final isLastStep = controlDetail.currentStep == 2;

            return drawControllerBuilder(context, isLastStep, controlDetail);
          },
        ),
      );
    });
  }

  // STEP NUMBER ONE
  drawStep1Content(BuildContext context, cubit) {
    return Column(
      children: [
        ReportScreenItem(
          context: context,
          title: 'Resident Name',
          readOnly: false,
          controller: widget.reportsCubit!.residentNameController,
          onChange: (residentName) {
            widget.reportsCubit!.setResidentName(residentName);
          },
          onComplete: () {},
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
                selectedRadio: widget.reportsCubit!.residentGenderValue!,
                value: widget.reportsCubit!.maleGenderValue!,
                label: 'Male',
                activeColor: secondaryColor,
                onChanged: (genderValue) {
                  print(genderValue);
                  if (widget.reportsCubit!.residentGenderValue == 1) {
                    widget.reportsCubit!.setResidntGenderValue(1);
                  } else {
                    widget.reportsCubit!.setResidntGenderValue(1);
                  }
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
                controller: widget.reportsCubit!.ageController,
                onChange: (residentAge) {
                  widget.reportsCubit!.setResidentAge(residentAge);
                },
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
                selectedRadio: widget.reportsCubit!.residentGenderValue!,
                value: widget.reportsCubit!.femaleGenderValue!,
                label: 'Female',
                activeColor: secondaryColor,
                onChanged: (genderValue) {
                  if (widget.reportsCubit!.residentGenderValue == 0) {
                    widget.reportsCubit!.setResidntGenderValue(0);
                  } else {
                    widget.reportsCubit!.setResidntGenderValue(0);
                  }

                  print(genderValue);
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
          controller: widget.reportsCubit!.bedController,
          onChange: (bedNumber) {
            widget.reportsCubit!.setBedNumber(bedNumber.toString());
          },
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
          controller: widget.reportsCubit!.medicalController,
          onChange: (medicalRecordNumber) {
            widget.reportsCubit!.setMedicalRecordNumber(medicalRecordNumber);
          },
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

  final problemTypeDropdownController = DropdownController();

  // STEP NUMBER TWO
  drawStep2Content(
    BuildContext context, ReportsCubit reportsCubit
  ) {
    return Column(
      children: [
        BuildStepperDropDownList(
          label: "Problem Type",
          itemsList: reportsCubit.fillProblemTypesList(reportsCubit.getProblemTypes()),
          reportsCubit: widget.reportsCubit,
          controller: widget.reportsCubit!.problemTypeDropdownController,
          onChange: (problemType) async {
            widget.reportsCubit!.setProblemType(problemType);
            if (widget.reportsCubit!.problemTypeDropdownController.isError) {
              await widget.reportsCubit!.problemTypeDropdownController
                  .resetError();
            }
          },
        ),
        const SizedBox(
          height: 40.0,
        ),
        ReportScreenItem(
          context: context,
          title: 'Problem Description',
          readOnly: false,
          onChange: (problemDesc) {
            widget.reportsCubit!.setProblemDescription(problemDesc);
          },
          validate: (value) {
            if (value.isEmpty) {
              return 'Problem description is empty';
            } else {
              return null;
            }
          },
          controller: widget.reportsCubit!.problemDescController,
        ),
        const SizedBox(
          height: 40.0,
        ),
        BuildStepperDropDownList(
          label: "Error Category",
          itemsList: reportsCubit.errorCategoriesList,
          reportsCubit: widget.reportsCubit,
          controller: widget.reportsCubit!.errorCategoryDropdownController,
          onChange: (errorCategory) async {
            widget.reportsCubit!.seterrorCategory(errorCategory);
            if (widget.reportsCubit!.errorCategoryDropdownController.isError) {
              await widget.reportsCubit!.errorCategoryDropdownController
                  .resetError();
            }
          },
        ),
        const SizedBox(
          height: 40.0,
        ),
        BuildStepperDropDownList(
          label: "Stage and Type of The Error",
          itemsList: [],
          reportsCubit: widget.reportsCubit,
          controller: widget.reportsCubit!.errorTypeDropdownController,
          onChange: (errorType) async {
            widget.reportsCubit!.setErrorType(errorType);
            if (widget.reportsCubit!.errorTypeDropdownController.isError) {
              await widget.reportsCubit!.errorTypeDropdownController
                  .resetError();
            }
          },
        ),
        const SizedBox(
          height: 40.0,
        ),
        ReportScreenItem(
          context: context,
          title: 'What\'s your reference?',
          readOnly: false,
          onChange: (ref) async {
            widget.reportsCubit!.setReference(ref);
          },
          validate: (value) {
            if (value.isEmpty) {
              return 'reference is empty';
            } else {
              return null;
            }
          },
          controller: widget.reportsCubit!.refrencesController,
        ),
      ],
    );
  }

  //STEP NUMBER THREE
  drawStep3Content(BuildContext context, cubit) {
    return Column(
      children: [
        ReportScreenItem(
          context: context,
          title: 'Write Your Intervention Here..',
          readOnly: false,
          onChange: (intervention) {
            widget.reportsCubit!.setInterventionTxt(intervention);
          },
          validate: (value) {
            if (value.isEmpty) {
              return 'Write Your Intervention Here..';
            } else {
              return null;
            }
          },
          controller: widget.reportsCubit!.interventionController,
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
                  [],
                  null,
                  widget.reportsCubit,
                  widget.reportsCubit!.drugNumber,
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
      Widget stepContent, ReportsCubit reportsCubit) {
    if (currentStep == 2) {
      drawFloatingActionButton(currentStep, reportsCubit);
    }

    return Step(
      state: reportsCubit.currentStep > currentStep
          ? StepState.complete
          : StepState.indexed,
      isActive: reportsCubit.currentStep >= currentStep,
      title: drawStepTitle(context, stepTitle),
      content: stepContent,
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
    final isFinalStep = widget.reportsCubit!.currentStep == 2;

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
                          token: widget.drAppToken,
                        );

                        showQuickAlert(
                          context: context,
                          alertType: QuickAlertType.success,
                          dialogMessage: 'Wait For Physician Acceptance',
                          actionTitle: 'Your Report Is Done Successfully!',
                          nextButtonTitle: 'Reports',
                          backButtonTitle: 'Another',
                          onNext: () {
                            widget.reportsCubit!.goTo(context, LayoutScreen());
                          },
                          onBack: () {
                            widget.reportsCubit!.goTo(
                                context,
                                DrDiscussionScreen(
                                    isReportScreen: true,
                                    drAppToken: widget.drAppToken));
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
      widget.reportsCubit!.changeForwardStep();
    }
  }

  onStepCancel() {
    return widget.reportsCubit!.currentStep == 0
        ? null
        : () {
            widget.reportsCubit!.changeBackwardStep();
          };
  }

  onStepTappped(int newStep) {
    widget.reportsCubit!.changeCurrentStep(newStep);
  }
}
