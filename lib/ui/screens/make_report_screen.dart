import 'package:clinical_pharmacist_intervention/main.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/Reports_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:substring_highlight/substring_highlight.dart';

class MakeReportScreen extends StatefulWidget {
  @override
  State<MakeReportScreen> createState() => _MakeReportScreenState();
}

class _MakeReportScreenState extends State<MakeReportScreen> {
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
                  backgroundColor: Color(0xffc1ddeb),
                  heroTag: Text('Add another drug'),
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
                              ),
                        ),
                        content: Column(
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            writeCard(context, 'Your Name'),
                            SizedBox(
                              height: 20.0,
                            ),
                            writeCard(context, 'Consultant Name'),
                            SizedBox(
                              height: 20.0,
                            ),
                            writeCard(context, 'Department'),
                            SizedBox(
                              height: 20.0,
                            ),
                            writeCard(context, 'Resident Name'),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: defaultRadio(
                                      context, selectedRadio1, 0, 'Male',
                                      (value) {
                                    setState(() {
                                      selectedRadio1 = value;
                                    });
                                  }),
                                ),
                                Expanded(
                                  child: defaultRadio(
                                      context, selectedRadio1, 1, 'Female',
                                      (value) {
                                    setState(() {
                                      selectedRadio1 = value;
                                    });
                                  }),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            writeCard(context, 'Bed Number'),
                            SizedBox(
                              height: 20.0,
                            ),
                            writeCard(context, 'Medical Record Number'),
                          ],
                        ),
                      ),
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
                              ),
                        ),
                        content: Column(
                          children: [
                            writeCard(context, 'Problem Type'),
                            SizedBox(
                              height: 20.0,
                            ),
                            writeCard(context, 'Problem Description'),
                            SizedBox(
                              height: 20.0,
                            ),
                            writeCard(
                              context,
                              'Is this a drug therapy problem ?',
                              readOnly: true,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: defaultRadio(
                                      context, selectedRadio2, 0, 'Yes',
                                      (value) {
                                    setState(() {
                                      selectedRadio2 = value;
                                    });
                                  }),
                                ),
                                Expanded(
                                  child: defaultRadio(
                                      context, selectedRadio2, 1, 'No',
                                      (value) {
                                    setState(() {
                                      selectedRadio2 = value;
                                    });
                                  }),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            writeCard(context, 'Error Category'),
                            SizedBox(
                              height: 20.0,
                            ),
                            writeCard(context, 'Error Description'),
                            SizedBox(
                              height: 20.0,
                            ),
                            writeCard(context, 'Stage and Type of error'),
                            SizedBox(
                              height: 20.0,
                            ),
                            writeCard(
                              context,
                              'Is this problem also a medical error ?',
                              readOnly: true,
                              size: 19.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: defaultRadio(
                                      context, selectedRadio3, 0, 'Yes',
                                      (value) {
                                    setState(() {
                                      selectedRadio3 = value;
                                    });
                                  }),
                                ),
                                Expanded(
                                  child: defaultRadio(
                                      context, selectedRadio3, 1, 'No',
                                      (value) {
                                    setState(() {
                                      selectedRadio3 = value;
                                    });
                                  }),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            writeCard(context, 'What\'s your reference?'),
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
                              ),
                        ),
                        content: Column(
                          children: [
                            writeCard(
                                context, 'Write Your Intervention Here..'),
                            SizedBox(
                              height: 20.0,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  child: ListView.separated(
                                    itemBuilder: (context, index) =>
                                        InterventionItem(
                                      context,
                                      drugs,
                                      fieldController,
                                      drugNumber,
                                    ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: 40,
                                    ),
                                    itemCount: drugNumber,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                  ),
                                  width: double.infinity,
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
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
                          context: context,
                          type: QuickAlertType.success,
                          text: 'Transaction Completed Successfully!',
                          showCancelBtn: true,
                          confirmBtnText: 'Reports',
                          cancelBtnText: 'Another',
                          title:
                              'Your report is sent to physician, please wait for response',
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
                          autoCloseDuration: Duration(seconds: 10),
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
              SizedBox(
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
                  fontSize: 34.0,
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
      style: TextStyle(
        fontSize: 18,
      ),
      maxLines: 10,
      minLines: 1,
      decoration: InputDecoration(
        hintText: readOnly ? title : '',
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: hintSize,
        ),
        contentPadding: EdgeInsetsDirectional.only(start: 15),
        border: InputBorder.none,
        label: !readOnly
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: hintSize,
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
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xffc1ddeb),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 3),
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
                ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Autocomplete(
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return Iterable<String>.empty();
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
                        color: Color(0xffc1ddeb),
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
                                        ),
                                textStyleHighlight: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: secondaryColor,
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
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xffc1ddeb),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                onEditingComplete: onEditingComplete,
                style: TextStyle(
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: 'write some drug ..',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  contentPadding: EdgeInsetsDirectional.only(start: 15),
                  border: InputBorder.none,
                ),
              ),
              margin: EdgeInsetsDirectional.only(bottom: 10),
            );
          },
        ),
        SizedBox(height: 5.0),
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
