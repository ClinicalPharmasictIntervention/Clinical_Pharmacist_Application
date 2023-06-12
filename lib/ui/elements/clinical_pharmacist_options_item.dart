import 'package:clinical_pharmacist_intervention/ui/elements/clinical_pharmacist_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/options_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/dr_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';


class ClinicalPharmacistDiscussionItem extends StatelessWidget {
  ClinicalPharmacistDiscussionItem({
    Key? key,
    // required this.clinPharmcist
  }) : super(key: key);
  // ClinPharmcist clinPharmcist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade400,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Card(
          elevation: 8.0,
          shadowColor: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClinicalPharmacistItem(name: "name", department: "clinical"),
              OptionsItem(phoneNumber: "phoneNumber", email: "", chatId: "chatId", name: '', appToken: '', )
            ],
          ),
        ),
      ),
    );
  }

}
