import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/constants.dart';

class BuildStepperDropDownList extends StatelessWidget {
  BuildStepperDropDownList({
    this.context,
    this.label,
    this.itemsList,
    this.reportsCubit,
    Key? key,
  }) : super(key: key);
  ReportsCubit? reportsCubit;
  BuildContext? context;
  String? label;
  List<CoolDropdownItem<String>>? itemsList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            label!,
            style: TextStyle(
                fontSize: 16,
                fontFamily: Lora,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        WillPopScope(
          onWillPop: () async {
            if (reportsCubit!.problemTypeDropdownController.isOpen) {
              reportsCubit!.problemTypeDropdownController.close();
              return Future.value(false);
            } else {
              return Future.value(true);
            }
          },
          child: CoolDropdown<String>(
            controller: reportsCubit!.problemTypeDropdownController,
            dropdownList: itemsList!,
            defaultItem: null,
            onChange: (value) async {
              if (reportsCubit!.problemTypeDropdownController.isError) {
                await reportsCubit!.problemTypeDropdownController.resetError();
              }
              // reportsCubit!.problemTypeDropdownController.close();
              print(value);
            },
            onOpen: (value) {
              print(value);
            },
            resultOptions: ResultOptions(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: Lora,
                  fontWeight: FontWeight.bold),
              boxDecoration: BoxDecoration(
                color: const Color(0xffc1ddeb),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width.toDouble(),
              height: 60,
              icon: const SizedBox(
                width: 10,
                height: 10,
                child: CustomPaint(
                  painter: DropdownArrowPainter(
                    color: Color(0xffc1ddeb),
                  ),
                ),
              ),
              render: ResultRender.all,
              placeholder: 'Select ' + label! + '...',
              placeholderTextStyle: const TextStyle(
                fontSize: 18,
                fontFamily: Lora,
                fontWeight: FontWeight.bold,
              ),
              isMarquee: true,
            ),
            dropdownOptions: const DropdownOptions(
              color: Color(0xffc1ddeb),
              top: 20,
              gap: DropdownGap.all(4),
              borderSide: BorderSide(width: 1, color: Colors.black),
              padding: EdgeInsets.symmetric(horizontal: 10),
              align: DropdownAlign.left,
              animationType: DropdownAnimationType.size,
            ),
            dropdownTriangleOptions: const DropdownTriangleOptions(
              width: 20,
              height: 30,
              align: DropdownTriangleAlign.left,
              borderRadius: 3,
              left: 20,
            ),
            dropdownItemOptions: const DropdownItemOptions(
              selectedTextStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontFamily: Lora,
                  fontWeight: FontWeight.bold),
              boxDecoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 87, 3),
              ),
              isMarquee: true,
              mainAxisAlignment: MainAxisAlignment.start,
              render: DropdownItemRender.all,
              height: 50,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: Lora,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
