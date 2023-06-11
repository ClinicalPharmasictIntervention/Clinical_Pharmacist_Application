import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_calindar_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_date_dialogue_actions.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_date_dialogue_title.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_daily_report_card.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/edit_profile_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/reports_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/report_details_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Row(
            children: [
              const Icon(
                size: 30,
                IconBroken.Notification,
                color: Colors.black87,
              ),
              const SizedBox(
                width: 15.0,
              ),
              Text(
                'Profile',
                style: txtTheme(context).headlineLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 30.0,
                      color: Colors.black87,
                      fontFamily: Lora,
                    ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              expandedHeight: MediaQuery.of(context).size.height * .40,
              collapsedHeight: MediaQuery.of(context).size.height * .40,
              floating: false,
              flexibleSpace: drawFlixibleSpaceFirstSliverAppBar(context),
            ),
            SliverAppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              leading: BlocConsumer<AppCubit, AppState>(
                listener: (context, state) {
                  if (state is ShowDateDialogueState) {
                    showDateDialogue(
                        context,
                        const BuildDateDialogueTitle(),
                        BuildCalendarItem(context),
                        const [BuildDateDialogueAction()]);
                  }
                },
                builder: (context, state) {
                  return drawLeaddingSecondSliverAppBar(context);
                },
              ),
              leadingWidth: MediaQuery.of(context).size.width * .2,
              actions: [
                BlocConsumer<AppCubit, AppState>(
                  listener: (context, state) {
                    if (state is ShowDateDialogueState) {}
                  },
                  builder: (context, state) {
                    return drawSearchTextField(context);
                  },
                ),
              ],
            ),
            SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // add item report
                  return InkWell(
                    onTap: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => ReportDetailsScreen(),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DefaultDailyReportCard(
                        isProfile: true,
                        context: context,
                        residentName: "kk",
                        physicianName: 'Ali',
                      ),
                    ),
                  );
                },
                childCount: 10,
              ),
              itemExtent: 170,
            )
          ],
        ),
      ),
    );
  }

  drawFlixibleSpaceFirstSliverAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 60.0, start: 8, bottom: 8.0, end: 8.0),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.height * .2,
                child: CircleAvatar(
                  child: Image.asset("assets/images/avatar_doctor.png"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Builder(builder: (context) {
                AppCubit.get(context).getPharmacistData();
                return BlocConsumer<AppCubit, AppState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var cubit = AppCubit.get(context);
                      return Text(
                        cubit.clinicalPharmacistModel.name,
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      );
                    });
              }),
              const SizedBox(
                height: 5,
              ),
              BlocConsumer<AppCubit, AppState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = AppCubit.get(context);
                    return Text(
                      cubit.clinicalPharmacistModel.hospitalId,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    );
                  }),
              BlocConsumer<AppCubit, AppState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<AppCubit>()
                          .goTo(context, EditProfileScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          IconBroken.Edit_Square,
                          size: 22,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Edit Profile")
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  drawLeaddingSecondSliverAppBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AppCubit>().showDateDialogue(context);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 4.0, start: 8, end: 8.0),
        child: SizedBox(
          child: Image.asset(
            "assets/images/notification_filter.png",
          ),
        ),
      ),
    );
  }

  drawSearchTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        child: DefaultTextField(
            hintTxt: "search with resident name",
            onTxtChange: (searchedString) {
              context.read<AppCubit>().searchInProfileReports(searchedString);
            }),
      ),
    );
  }
}
