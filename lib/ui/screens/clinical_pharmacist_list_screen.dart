import 'package:clinical_pharmacist_intervention/ui/elements/clinical_pharmacist_options_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/dr_options_item.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class ClinicalPharmacistDiscussionScreen extends StatelessWidget {
  const ClinicalPharmacistDiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Clinical Pharmacists List"),
          titleSpacing: 3.0,
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 70,
              margin: const EdgeInsetsDirectional.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.grey)),
              child: Card(
                child: EasySearchBar(
                    backgroundColor: Colors.white,
                    title: const Text(
                        textDirection: TextDirection.ltr,
                        "search for a clinica parmacist"),
                    onSearch: (v) {}),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ClinicalPharmacistDiscussionItem();
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
    );
  }
}
