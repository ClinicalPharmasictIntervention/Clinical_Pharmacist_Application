import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_steper.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/custom_app_bar.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/report_screen_appbar.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/report_screen_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
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

  List<dynamic> icons = [
    IconBroken.Profile,
    IconBroken.Info_Circle,
    IconBroken.Edit,
  ];

  PageController controller = PageController(initialPage: 0);

  int pageIndex = 0;
  int currentStep = 0;

  bool isCompleted = false;


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
        floatingActionButton: drawFloatingActionButton(currentStep),

        appBar: CustomAppBar(
            titleWidget: BuildReportScreenAppBarTitle(
              context: context,
              titleText: titles[currentStep],
              icon: icons[currentStep],
            ),
            backgroundColor: Colors.transparent,
            opacity: 0.0,
            elevation: 0.0,
            leading: const BuildReportScreenAppBarLeading(),
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
                  child: BuildRepotSteper(currentStep: currentStep,)
       
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
  int drugNumber = 1;

  drawFloatingActionButton(int currentStep) {
    if (currentStep == 2) {
      return Padding(
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
      );
    } else {
      return Container();
    }
  }
}



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
          ReportScreenTextField(title: title, readOnly: readOnly, hintSize: size),
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
            Expanded(child: writeCard(context, 'Physician Dose')),
            // SizedBox(
            //   width: 10,
            // ),
            Expanded(child: writeCard(context, 'Your Dose')),
          ],
        ),
      ],
    );
