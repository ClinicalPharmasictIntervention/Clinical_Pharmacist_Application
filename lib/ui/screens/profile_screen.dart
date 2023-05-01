import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_daily_report_card.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/notification_item.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/reports_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/make_report_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/report_details_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
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
              expandedHeight: MediaQuery.of(context).size.height * .25,
              collapsedHeight: MediaQuery.of(context).size.height * .25,
              floating: false,
              flexibleSpace: Padding(
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
                            child:
                                Image.asset("assets/images/avatar_doctor.png"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "name",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "id",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        GestureDetector(
                            onTap: () {},
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
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              floating: true,
              //backgroundColor: Color.fromARGB(255, 140, 171, 196),
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 8.0, start: 8, end: 16.0),
                  child: SizedBox(
                    // height: 50,
                    width: 50,
                    child: Image.asset(
                      "assets/images/notification_filter.png",
                    ),
                  ),
                ),
              ),
              leadingWidth: 55,
              actions: [
                SizedBox(
                  width: 350,
                  height: 50,
                  child: DefaultTextField(
                    hintTxt: "search with ",
                  ),
                ),
              ],
            ),
            SliverFixedExtentList(
              //key: Random.secure().nextInt(500).toString(),
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
                        context: context,
                        residentName: 'Ali',
                        physicianName: 'Karim',
                        isProfile: true,
                        date: '25/4/2020',
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
}
