import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/dr_options_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class DrDiscussionScreen extends StatelessWidget {
  const DrDiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          /*
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              "Doctors List",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            titleSpacing: 3.0,
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          */
          body: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
         Container(
                width: 360,
                child: DefaultTextField(
                  hintTxt: 'Search with physician name',
                  prefixIcon: IconBroken.Search,
                  onTxtChange: (text) {},
                ),
              ),
             
              Expanded(
                child: Container(
                  height: double.infinity,
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return DrDiscussionItem();
                      },
                      // separatorBuilder: (context, index) {
                      //   return Divider();
                      // },
                      itemCount: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
