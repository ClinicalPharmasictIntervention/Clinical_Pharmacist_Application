import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/edit_profile_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/reports_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/report_details_screen.dart';
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
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              expandedHeight: MediaQuery.of(context).size.height * .32,
              collapsedHeight: MediaQuery.of(context).size.height * .32,
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
                    ShowDateDialogue(context);
                  }
                },
                builder: (context, state) {
                  return drawLeaddingSecondSliverAppBar(context);
                },
              ),
              leadingWidth: 55,
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
                      child: reportCard(context, isProfile: true),
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
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  child: Image.asset("assets/images/avatar_doctor.png"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocConsumer<AppCubit, AppState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return const Text(
                      "name",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    );
                  }),
              const SizedBox(
                height: 5,
              ),
              BlocConsumer<AppCubit, AppState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return const Text(
                      "id",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    );
                  }),
              BlocConsumer<AppCubit, AppState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        //BlocProvider.of<AppCubit>(context).goTo(context,EditProfileScreen());
                        //AppCubit().goTo(context, EditProfileScreen());
                        context.read<AppCubit>().goTo(context,   EditProfileScreen());
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
        padding:
            const EdgeInsetsDirectional.only(top: 8.0, start: 8, end: 16.0),
        child: SizedBox(
          // height: 50,
          width: 50,
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
        width: 350,
        height: 50,
        child: DefaultTextField(
            hintTxt: "search with ",
            onTxtChange: (searchedString) {
              context.read<AppCubit>().searchInProfileReports(searchedString);
            }),
      ),
    );
  }
}
