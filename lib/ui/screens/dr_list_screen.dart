import 'package:build_context_provider/build_context_provider.dart';
import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/data/models/doctor_model.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/dr_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/dr_options_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/make_report_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrDiscussionScreen extends StatefulWidget {
  DrDiscussionScreen({
    required this.isReportScreen,
    this.drAppToken,
  });

  @override
  bool isReportScreen = false;
  String? drAppToken;

  @override
  State<DrDiscussionScreen> createState() => _DrDiscussionScreenState();
}

class _DrDiscussionScreenState extends State<DrDiscussionScreen> {
  late var allDoctors;

  @override
  void initState() {
    allDoctors = BlocProvider.of<AppCubit>(context).getPhysicians();

    super.initState();
  }

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
        appBar: drawAppBar(context),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            drawSearchBar(context),
            const SizedBox(
              height: 30,
            ),
            BlocConsumer<AppCubit, AppState>(
              listener: (context, state) {
                print(state);
                if (state is GetPhysiciansLoadingState) {
                  allDoctors = state.physicians;
                }
              },
              builder: (context, state) {
                return Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          
                          final DoctorModel doctor = allDoctors[index];
                          print(doctor.name);

                          if (!widget.isReportScreen) {
                            return DrOptionsItem(
                              doctor: doctor,
                            );
                          } else {
                            return InkWell(
                              onTap: () {
                                navigateTo(
                                  context,
                                  MakeReportScreen(
                                    doctor: doctor,
                                  ),
                                );
                              },
                              child: DrItem(
                                department: doctor.department!,
                                name: doctor.name!,
                              ),
                            );
                          }
                        },
                        itemCount: 1),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  drawAppBar(BuildContext context) {
    return AppBar(
      leading: widget.isReportScreen
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                IconBroken.Arrow___Left_2,
                color: Colors.black,
              ),
            )
          : null,
      leadingWidth: widget.isReportScreen ? 50 : 0,
      title: Row(
        children: [
          const Icon(
            size: 30,
            IconBroken.User1,
            color: Colors.black87,
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            'Physicians',
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
    );
  }

  drawSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 7,
        child: DefaultTextField(
          hintTxt: 'Search with physician name',
          prefixIcon: IconBroken.Search,
          onTxtChange: (text) {},
        ),
      ),
    );
  }
}


/*


import 'package:build_context_provider/build_context_provider.dart';
import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/data/models/doctor_model.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/dr_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/dr_options_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/make_report_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrDiscussionScreen extends StatefulWidget {
  DrDiscussionScreen({
    required this.isReportScreen,
    this.drAppToken,
  });

  @override
  bool isReportScreen = false;
  String? drAppToken;

  @override
  State<DrDiscussionScreen> createState() => _DrDiscussionScreenState();
}

class _DrDiscussionScreenState extends State<DrDiscussionScreen> {
  late List<DoctorModel> allDoctors;

  @override
  void initState() {
    allDoctors = BlocProvider.of<AppCubit>(context).getPhysicians();

    super.initState();
  }

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
        appBar: AppBar(
          leading: widget.isReportScreen
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    IconBroken.Arrow___Left_2,
                    color: Colors.black,
                  ),
                )
              : null,
          leadingWidth: widget.isReportScreen ? 50 : 0,
          title: Row(
            children: [
              const Icon(
                size: 30,
                IconBroken.User1,
                color: Colors.black87,
              ),
              const SizedBox(
                width: 15.0,
              ),
              Text(
                'Physicians',
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
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 7,
                child: DefaultTextField(
                  hintTxt: 'Search with physician name',
                  prefixIcon: IconBroken.Search,
                  onTxtChange: (text) {},
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocConsumer<AppCubit, AppState>(
              listener: (context, state) {
                print(state);
                if (state is GetPhysiciansLoadingState) {


                 allDoctors=(state).physicians;
                 print("object");
                 print(allDoctors) ;
                }
              },
              builder: (context, state) {
                var cubit = AppCubit.get(context);

                return Expanded(
                  child: SizedBox(
                    height: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        if (!widget.isReportScreen) {
                          return DrOptionsItem(
                            doctor: cubit.physicians[index],
                          );
                        }
                        return InkWell(
                          onTap: () {
                            ReportsCubit().doctor!.id =
                                cubit.physicians[index].id;
                            print("hh $ReportsCubit().doctor!.id");

                            navigateTo(
                                context,
                                MakeReportScreen(
                                  drAppToken: cubit.physicians[index].appToken,
                                  drId: cubit.physicians[index].id,
                                ));
                          },
                          child: DrItem(
                            department: cubit.physicians[index].department!,
                            name: cubit.physicians[index].name!,
                          ),
                        );
                      },
                      itemCount: cubit.physicians.length,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
*/