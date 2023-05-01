import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_daily_report_card.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_filter_chip.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/make_report_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/report_details_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportsCubit, ReportsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ReportsCubit.get(context);
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MakeReportScreen()),
                );
              },
              child: Icon(Icons.add, color: secondaryColor),
              tooltip: 'Make Report',
            ),
            appBar: AppBar(
              leadingWidth: 0,
              title: Row(
                children: [
                  Icon(
                    size: 30,
                    IconBroken.Document,
                    color: Colors.black87,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'Daily Reports',
                    style: txtTheme(context).headlineLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 30.0,
                          color: Colors.black87,
                          fontFamily: Lora,
                        ),
                  ),
                ],
              ),
              backgroundColor: Colors.transparent,
              bottomOpacity: 0.0,
              elevation: 0.0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    width: 360,
                    child: DefaultTextField(
                      hintTxt: 'Search with resident name',
                      prefixIcon: IconBroken.Search,
                      onTxtChange: (text) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultFilterChip(
                          context: context,
                          title: 'Accepted',
                          color: cubit.acceptSelected,
                          onSelected: (value) {
                            cubit.changeFilterChip(stateType: 'Accepted');
                          },
                          icon: IconBroken.Shield_Done,
                        ),
                        DefaultFilterChip(
                          context: context,
                          title: 'Pending',
                          color: cubit.pendingSelected,
                          onSelected: (value) {
                            cubit.changeFilterChip(stateType: 'Pending');
                          },
                          icon: IconBroken.Time_Circle,
                        ),
                        DefaultFilterChip(
                          context: context,
                          title: 'Rejected',
                          color: cubit.rejectedSelected,
                          onSelected: (value) {
                            cubit.changeFilterChip(stateType: 'Rejected');
                          },
                          icon: IconBroken.Shield_Fail,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) => ReportDetailsScreen(),
                        ),
                        child: Center(
                          child: DefaultDailyReportCard(
                            context: context,
                            residentName: 'Ali',
                            physicianName: 'Karim',
                            time: '3.15',
                            isProfile: false,
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
