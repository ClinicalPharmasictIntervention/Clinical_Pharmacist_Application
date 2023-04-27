import 'package:clinical_pharmacist_intervention/ui/elements/dr_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/options_item.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

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
          image: const DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
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
