import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/layout_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/make_report_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/report_details_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MakeReportScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        elevation: 10,
        tooltip: 'Make Report',
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            IconBroken.Arrow___Left_2,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LayoutScreen()));
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Row(
            children: [
              const Icon(
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
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DefaultTextField(
              hintTxt: 'Search with resident name',
              prefixIcon: IconBroken.Search,
              onTxtChange: (text) {},
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  defaultFilterChip(
                    context,
                    'Accepted',
                    IconBroken.Shield_Done,
                    secondaryColor,
                  ),
                  defaultFilterChip(
                    context,
                    'Pending',
                    IconBroken.Time_Circle,
                    Colors.grey[400],
                  ),
                  defaultFilterChip(
                    context,
                    'Rejected',
                    IconBroken.Shield_Fail,
                    Colors.grey[400],
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
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3, 3),
                            spreadRadius: 1,
                            blurRadius: 10,
                            color: Colors.grey,
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [
                            secondaryColor,
                            Colors.tealAccent,
                            secondaryColor
                          ],
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      width: 400,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            cardContent(
                                context, 'Patient Name', '     Ali Ahmed'),
                            const SizedBox(
                              height: 15.0,
                            ),
                            cardContent(context, 'Physician Name',
                                'Karim Abd El-Raouf'),
                            const SizedBox(
                              height: 15.0,
                            ),
                            cardContent(context, 'Intervention Time', ' 3:15'),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Show details..',
                                    style:
                                        txtTheme(context).titleMedium!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Lora,
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(2, 2),
                                          blurRadius: 10,
                                          spreadRadius: 50,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    IconBroken.Arrow___Up_2,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
    );
  }

  Widget cardContent(context, label, title) => Row(
        children: [
          Text(
            '${label}       ',
            style: txtTheme(context).titleMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: Lora,
              shadows: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(3, 3),
                  blurRadius: 10,
                  spreadRadius: 50,
                ),
              ],
            ),
          ),
          Text(
            '${title}',
            style: txtTheme(context).titleMedium!.copyWith(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontFamily: Lora,
              shadows: [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 5),
                  blurRadius: 50,
                  spreadRadius: 10,
                ),
              ],
            ),
          ),
        ],
      );

  Widget defaultFilterChip(context, title, icon, color) => FilterChip(
        label: Text(
          title,
          style: txtTheme(context).titleMedium!.copyWith(
            fontFamily: Lora,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: 50,
              ),
            ],
          ),
        ),
        onSelected: (val) {},
        backgroundColor: color,
        elevation: 3.0,
        avatar: Icon(icon),
      );
}

// void showOverlay(context) {
//   OverlayState? overlayState = Overlay.of(context);
//   OverlayEntry? overlayEntry;
//
//   var size = MediaQuery.of(context).size;
//
//   overlayEntry = OverlayEntry(builder: (context) {
//     return Positioned(
//       right: 60,
//       top: 100,
//       height: size.height * 0.8,
//       width: size.width,
//       child: ReportDetailsScreen(),
//     );
//   });
//
//   overlayState!.insert(overlayEntry);
// }
