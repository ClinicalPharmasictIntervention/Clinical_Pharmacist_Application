import 'package:clinical_pharmacist_intervention/main.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        elevation: 10,
        tooltip: 'Make Report',
      ),
      appBar: AppBar(
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
                      fontSize: 34.0,
                      color: Colors.black87,
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
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            DefaultTextField(
              hintTxt: 'Search',
              prefixIcon: IconBroken.Search,
              onTxtChange: (text) {},
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Expanded(
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
                      'Deinied',
                      IconBroken.Shield_Fail,
                      Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {},
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
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
                      height: 130,
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
                ),
          ),
          Text(
            '${title}',
            style: txtTheme(context).titleMedium!.copyWith(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      );

  Widget defaultFilterChip(context, title, icon, color) => FilterChip(
        label: Text(
          title,
          style: txtTheme(context).titleMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        onSelected: (val) {},
        backgroundColor: color,
        elevation: 3.0,
        avatar: Icon(icon),
      );
}
