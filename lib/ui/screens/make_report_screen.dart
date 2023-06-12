import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_steper.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/report_screen_appbar.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/report_screen_item.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:flutter/material.dart';

class MakeReportScreen extends StatelessWidget {
  MakeReportScreen({
    this.drAppToken,
    this.drId,
  });

  String? drAppToken;
  String? drId;
  ReportsCubit reportsCubit = ReportsCubit();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocConsumer<ReportsCubit, ReportsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: drawAppBar(
                context,
                reportsCubit.icons[reportsCubit.currentStep],
                reportsCubit.titles[reportsCubit.currentStep],
              ),
              floatingActionButton: drawFloatingActionButton(
                  reportsCubit.currentStep, reportsCubit),
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
                            drAppToken: drAppToken,
                            drId: drId,
                            reportsCubit: reportsCubit),
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

drawFloatingActionButton(int currentStep, cubit) {
  if (currentStep == 2) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FloatingActionButton(
        onPressed: () {
          cubit.updateNewDrug();
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
