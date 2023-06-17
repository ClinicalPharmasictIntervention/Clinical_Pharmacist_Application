import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/reports_cubit.dart';
import 'package:clinical_pharmacist_intervention/data/models/doctor_model.dart';
import 'package:clinical_pharmacist_intervention/main.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_stepe_dropdown_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/report_screen_item.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/Reports_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:substring_highlight/substring_highlight.dart';

class MakeReportScreen extends StatefulWidget {
  MakeReportScreen({this.doctor});

  DoctorModel? doctor;

  @override
  State<MakeReportScreen> createState() => _MakeReportScreenState();
}

class _MakeReportScreenState extends State<MakeReportScreen> {
  ReportsCubit reportsCubit = ReportsCubit();
  late var allDrugs;

  @override
  initState() {
    reportsCubit.setDoctor(widget.doctor);

    allDrugs = BlocProvider.of<ReportsCubit>(context).getDrugs();
    super.initState();
  }

  @override
  List<String> titles = [
    'Resident Info',
    'Problems',
    'Your Intervention',
  ];

  List<dynamic> icon = [
    IconBroken.Profile,
    IconBroken.Info_Circle,
    IconBroken.Edit,
  ];

  PageController controller = PageController(initialPage: 0);

  int pageIndex = 0;
  int currentStep = 0;
  int? selectedRadio1 = 0;
  int? selectedRadio2 = 0;
  int? selectedRadio3 = 0;
  int drugNumber = 1;
  bool isCompleted = false;
  TextEditingController? fieldController;

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
        floatingActionButton: currentStep == 2
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      drugNumber++;
                    });
                  },
                  backgroundColor: const Color(0xffc1ddeb),
                  heroTag: const Text('Add another drug'),
                  child: Icon(Icons.add, color: secondaryColor),
                ),
              )
            : null,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              IconBroken.Arrow___Left_2,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: appBarContent(context, titles[currentStep], icon[currentStep]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Theme(
                  data: ThemeData(
                    canvasColor: const Color(0xffc1ddeb),
                  ),
                  child: Stepper(
                    steps: [
                      Step(
                        state: currentStep > 0
                            ? StepState.complete
                            : StepState.indexed,
                        isActive: currentStep >= 0,
                        title: Text(
                          'Resident',
                          style: txtTheme(context).displaySmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: Lora,
                              ),
                        ),
                        content: Column(
                          children: [
                            ReportScreenItem(
                              context: context,
                              title: 'Resident Name',
                              readOnly: false,
                              controller: reportsCubit.residentNameController,
                              onChange: (residentName) {
                                reportsCubit.setResidentName(residentName);
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
                                  child: defaultRadio(
                                      context, selectedRadio2, 0, 'Male',
                                      (value) {
                                    setState(() {
                                      selectedRadio2 = value;
                                    });
                                  }),
                                ),
                                Expanded(
                                  child: defaultRadio(
                                      context, selectedRadio2, 1, 'Female',
                                      (value) {
                                    setState(() {
                                      selectedRadio2 = value;
                                    });
                                  }),
                                ),
                                SizedBox(
                                  width: 60,
                                  child: ReportScreenItem(
                                    context: context,
                                    title: 'Age',
                                    readOnly: false,
                                    hintSize: 17,
                                    controller: reportsCubit!.ageController,
                                    onChange: (residentAge) {
                                      reportsCubit!.setResidentAge(residentAge);
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
                              onChange: (bedNumber) {
                                reportsCubit!
                                    .setBedNumber(bedNumber.toString());
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
                              controller: reportsCubit!.medicalController,
                              onChange: (medicalRecordNumber) {
                                reportsCubit!.setMedicalRecordNumber(
                                    medicalRecordNumber);
                                print(medicalRecordNumber);
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
                        ),
                      ),

                      //////////////////////////////////////
                      Step(
                        state: currentStep > 1
                            ? StepState.complete
                            : StepState.indexed,
                        isActive: currentStep >= 1,
                        title: Text(
                          'Problem',
                          style: txtTheme(context).displaySmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: Lora,
                              ),
                        ),
                        content: Column(
                          children: [
                            BuildStepperDropDownList(
                              label: "Problem Type",
                              itemsList: reportsCubit.problemTypesList,
                              controller:
                                  reportsCubit!.problemTypeDropdownController,
                              onChange: (problemType) async {
                                reportsCubit!.setProblemType(problemType);
                                if (reportsCubit!
                                    .problemTypeDropdownController.isError) {
                                  await reportsCubit!
                                      .problemTypeDropdownController
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
                                reportsCubit!
                                    .setProblemDescription(problemDesc);
                              },
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
                            BuildStepperDropDownList(
                              label: "Error Category",
                              itemsList: reportsCubit.errorCategoriesList,
                              controller:
                                  reportsCubit!.errorCategoryDropdownController,
                              onChange: (errorCategory) async {
                                reportsCubit!.seterrorCategory(errorCategory);
                                if (reportsCubit!
                                    .errorCategoryDropdownController.isError) {
                                  await reportsCubit!
                                      .errorCategoryDropdownController
                                      .resetError();
                                }
                              },
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            BuildStepperDropDownList(
                              label: "Stage and Type of The Error",
                              itemsList: reportsCubit.errorTypesList,
                              controller:
                                  reportsCubit!.errorTypeDropdownController,
                              onChange: (errorType) async {
                                reportsCubit!.setErrorType(errorType);
                                if (reportsCubit!
                                    .errorTypeDropdownController.isError) {
                                  await reportsCubit!
                                      .errorTypeDropdownController
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
                                reportsCubit!.setReference(ref);
                              },
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
                        ),
                      ),
                      Step(
                        isActive: currentStep >= 2,
                        title: Text(
                          'Intervention',
                          style: txtTheme(context).displaySmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: Lora,
                              ),
                        ),
                        content: Column(
                          children: [
                            ReportScreenItem(
                              context: context,
                              title: 'Write Your Intervention Here..',
                              readOnly: false,
                              onChange: (intervention) {
                                reportsCubit.setInterventionTxt(intervention);
                              },
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'Write Your Intervention Here..';
                                } else {
                                  return null;
                                }
                              },
                              controller: reportsCubit.interventionController,
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
                                    itemBuilder: (context, index) =>
                                        InterventionItem(
                                      context,
                                      reportsCubit.drugs,
                                      fieldController,
                                      drugNumber,
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 40,
                                    ),
                                    itemCount: drugNumber,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                    currentStep: currentStep,
                    type: StepperType.horizontal,
                    elevation: 0,
                    onStepContinue: () {
                      final isFinalStep = currentStep == 2;
                      if (isFinalStep) {
                        print('completed');
                        QuickAlert.show(
                          textColor: Colors.transparent,
                          context: context,
                          type: QuickAlertType.success,
                          text: 'Transaction Completed Successfully!',
                          showCancelBtn: true,
                          confirmBtnText: 'Reports',
                          cancelBtnText: 'Another',
                          title:
                              'Your report is sent to physician, please wait for response...',
                          onConfirmBtnTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportsScreen()),
                            );
                          },
                          onCancelBtnTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MakeReportScreen()),
                            );
                          },
                        );
                      } else {
                        setState(() => ++currentStep);
                      }
                    },
                    onStepCancel: currentStep == 0
                        ? null
                        : () => setState(() => --currentStep),
                    onStepTapped: (step) => setState(() => currentStep = step),
                    controlsBuilder: (context, ControlsDetails controlDetail) {
                      final isLastStep = controlDetail.currentStep == 2;

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
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget appBarContent(context, title, IconData icon) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        children: [
          Icon(
            size: 30,
            icon,
            color: Colors.black87,
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            title,
            style: txtTheme(context).headlineLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                  fontFamily: Lora,
                  color: Colors.black87,
                ),
          ),
        ],
      ),
    );

Widget customTextField(
  context,
  title, {
  double hintSize = 20.0,
  readOnly = false,
}) =>
    TextField(
      readOnly: readOnly,
      style: const TextStyle(
        fontSize: 18,
        fontFamily: Lora,
      ),
      maxLines: 10,
      minLines: 1,
      decoration: InputDecoration(
        hintText: readOnly ? title : '',
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: hintSize,
          fontFamily: Lora,
        ),
        contentPadding: const EdgeInsetsDirectional.only(start: 15),
        border: InputBorder.none,
        label: !readOnly
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: hintSize,
                    fontFamily: Lora,
                  ),
                ),
              )
            : null,
      ),
    );

Widget writeCard(
  context,
  String title, {
  double hintSize = 20.0,
  readOnly = false,
  size = 20.0,
}) =>
    Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xffc1ddeb),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child:
          customTextField(context, title, readOnly: readOnly, hintSize: size),
    );

//width: 70,
//   height: 55,
//   child: writeCard(context, 'Age'),
Widget defaultRadio(context, selectedRadio, value, lable, onChanged) =>
    RadioListTile(
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

Widget InterventionItem(
        context, List<String> drugs, fieldController, drugNumber) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            'Drug $drugNumber',
            style: txtTheme(context).headlineMedium!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  color: secondaryColor,
                  fontFamily: Lora,
                ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Autocomplete(
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            } else {
              return drugs.where((word) {
                return word.toLowerCase().contains(
                      textEditingValue.text.toLowerCase(),
                    );
                return true;
              }).toList();
            }
          },
          onSelected: (value) {
            fieldController.text = value;
          },
          optionsViewBuilder: (
            context,
            onSelected,
            options,
          ) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      width: 355,
                      child: Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(15),
                        borderOnForeground: true,
                        color: const Color(0xffc1ddeb),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final option = options.elementAt(index);
                            return ListTile(
                              onTap: () {
                                fieldController.text = option;
                              },
                              title: SubstringHighlight(
                                text: option.toString(),
                                term: fieldController.text,
                                textStyle:
                                    txtTheme(context).displaySmall!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: Lora,
                                        ),
                                textStyleHighlight: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: secondaryColor,
                                  fontFamily: Lora,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Container(
                            width: 2,
                            height: 2,
                            color: Colors.grey[300],
                          ),
                          itemCount: options.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          fieldViewBuilder: (
            context,
            controller,
            focusNode,
            onEditingComplete,
          ) {
            fieldController = controller;
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color(0xffc1ddeb),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                onEditingComplete: onEditingComplete,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: Lora,
                ),
                decoration: const InputDecoration(
                  hintText: 'write some drug ..',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: Lora,
                  ),
                  contentPadding: EdgeInsetsDirectional.only(start: 15),
                  border: InputBorder.none,
                ),
              ),
              margin: const EdgeInsetsDirectional.only(bottom: 10),
            );
          },
        ),
        const SizedBox(height: 5.0),
        Row(
          children: [
            Expanded(child: writeCard(context, 'Physician Dose')),
            // SizedBox(
            //   width: 10,
            // ),
            Expanded(child: writeCard(context, 'Your Dose')),
          ],
        ),
      ],
    );


/*
import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/reports_cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/reports_states.dart';
import 'package:clinical_pharmacist_intervention/data/models/doctor_model.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_steper.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/report_screen_appbar.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/report_screen_item.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:flutter/material.dart';

class MakeReportScreen extends StatefulWidget {
  MakeReportScreen({this.doctor});

  DoctorModel? doctor;

  @override
  State<MakeReportScreen> createState() => _MakeReportScreenState();
}

class _MakeReportScreenState extends State<MakeReportScreen> {
  ReportsCubit reportsCubit = ReportsCubit();
  late var allDrugs;

  @override
  initState() {
    reportsCubit.setDoctor(widget.doctor);

    allDrugs = BlocProvider.of<ReportsCubit>(context).getDrugs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child:
          BlocConsumer<ReportsCubit, ReportsStates>(listener: (context, state) {
        if (state is GetDrugsState) {
          allDrugs = state.drugs;
          print(allDrugs);
        } 
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: drawAppBar(
            context,
            reportsCubit.icons[reportsCubit.currentStep],
            reportsCubit.titles[reportsCubit.currentStep],
          ),
          floatingActionButton:
              drawFloatingActionButton(reportsCubit.currentStep, reportsCubit),
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Theme(
                    data: ThemeData(
                      canvasColor: const Color(0xffc1ddeb),
                    ),
                    child: BuildReportStepper(
                      drAppToken: widget.doctor!.appToken,
                      drId: widget.doctor!.id,
                      reportsCubit: reportsCubit,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  drawAppBar(BuildContext context, IconData icon, String titleText) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottomOpacity: 0,
        title: BuildReportScreenAppBarTitle(
          context: context,
          icon: icon,
          titleText: titleText,
        ),
        leading: const BuildReportScreenAppBarLeading());
  }
}

drawFloatingActionButton(int currentStep, ReportsCubit reportsCubit) {
  if (currentStep == 2) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FloatingActionButton(
        onPressed: () {
          reportsCubit.addNewDrug();
        },
        backgroundColor: defaultColor,
        heroTag: const Text('Add another drug'),
        child: Icon(Icons.add, color: secondaryColor),
      ),
    );
  } else {
    return Container();
  }
}

InterventionItem(
  context,
  List<String> drugs,
  fieldController,
  cubit,
  drugNumber,
) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            'Drug $drugNumber',
            style: txtTheme(context).headlineMedium!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  color: secondaryColor,
                  fontFamily: Lora,
                ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Autocomplete(
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            } else {
              return drugs.where((word) {
                return word.toLowerCase().contains(
                      textEditingValue.text.toLowerCase(),
                    );
              }).toList();
            }
          },
          onSelected: (value) {
            fieldController.text = value;
            cubit.onAutoCompleteChanged();
          },
          optionsViewBuilder: (
            context,
            onSelected,
            options,
          ) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 300,
                      width: 355,
                      child: Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(15),
                        borderOnForeground: true,
                        color: const Color(0xffc1ddeb),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final option = options.elementAt(index);
                            return ListTile(
                              onTap: () {
                                fieldController.text = option;
                                cubit.onAutoCompleteChanged();
                              },
                              title: SubstringHighlight(
                                text: option.toString(),
                                term: fieldController.text,
                                textStyle:
                                    txtTheme(context).displaySmall!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: Lora,
                                        ),
                                textStyleHighlight: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: secondaryColor,
                                  fontFamily: Lora,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Container(
                            width: 2,
                            height: 2,
                            color: Colors.grey[300],
                          ),
                          itemCount: options.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          fieldViewBuilder: (
            context,
            controller,
            focusNode,
            onEditingComplete,
          ) {
            fieldController = controller;
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color(0xffc1ddeb),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              margin: const EdgeInsetsDirectional.only(bottom: 10),
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                onEditingComplete: onEditingComplete,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: Lora,
                ),
                decoration: const InputDecoration(
                  hintText: 'write some drug ..',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: Lora,
                  ),
                  contentPadding: EdgeInsetsDirectional.only(start: 15),
                  border: InputBorder.none,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 5.0),
        Row(
          children: [
            Expanded(
              child: ReportScreenItem(
                title: 'Physician Dose',
                readOnly: false,
                context: context,
              ),
            ),
            // SizedBox(
            //   width: 10,
            // ),
            Expanded(
              child: ReportScreenItem(
                title: 'Your Dose',
                readOnly: false,
                context: context,
              ),
            ),
          ],
        ),
      ],
    );
*/