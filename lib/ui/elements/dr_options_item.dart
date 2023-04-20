import 'package:clinical_pharmacist_intervention/ui/elements/dr_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/options_item.dart';
import 'package:flutter/material.dart';


class DrDiscussionItem extends StatelessWidget {
  DrDiscussionItem({
    Key? key,
    // required this.dr
  }) : super(key: key);
  // Dr dr;

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
              DrItem(name: "name", department: "department"),
              OptionsItem(phoneNumber: "phoneNumber", chatId: "chatId")
            ],
          ),
        ),
      ),
    );
  }
}
