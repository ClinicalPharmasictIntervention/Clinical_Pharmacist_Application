import 'package:build_context_provider/build_context_provider.dart';
import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/cubit.dart';
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

class DrDiscussionScreen extends StatelessWidget {
  DrDiscussionScreen({
    required this.isReportScreen,
    this.drAppToken,
  });

  @override
  bool isReportScreen = false;
  String? drAppToken;

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
          leading: isReportScreen
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
          leadingWidth: isReportScreen ? 50 : 0,
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
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = AppCubit.get(context);
                AppCubit.get(context).getData(path: "v1/physician/",storeList: AppCubit.get(context).physicians);
                return Expanded(
                  child: SizedBox(
                    height: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        if (!isReportScreen) {
                          return DrOptionsItem(
                            doctor: cubit.physicians[index],
                          );
                        }
                        return InkWell(
                          onTap: () {
                              ReportsCubit().doctor!.id=cubit.physicians[index].id;
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
