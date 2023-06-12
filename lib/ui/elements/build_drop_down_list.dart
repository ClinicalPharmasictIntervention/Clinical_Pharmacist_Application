import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';

class BuildDropDownList extends StatelessWidget {
  const BuildDropDownList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var departmentsList = [];
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade600,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(cornersRadiusConst),
        ),
      ),
      child: DropdownButton(
        alignment: AlignmentDirectional.centerStart,
        dropdownColor: Colors.transparent,
        iconEnabledColor: Colors.black,
        isExpanded: true,
        itemHeight: 60,

        hint: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(
              width: 10,
            ),
            Icon(
              IconBroken.Category,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "Depatment",
            ),
          ],
        ),

        //value: department,

        onChanged: (String? ch) {
        //  myDepartment = ch!;
        },

        items: departmentsList.map<DropdownMenuItem<String>>(
          (itemTxt) {
            return DropdownMenuItem<String>(
              value: itemTxt,
              child: drawDropDownListItem(context, itemTxt),
            );
          },
        ).toList(),
      ),
    );
  }

  drawDropDownListItem(BuildContext context, String itemTxt) {
    return Center(
      child: Container(
        margin: const EdgeInsetsDirectional.all(2.0),
        width: MediaQuery.of(context).size.width * .4,
        decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                width: 5,
                color: Colors.grey.shade600,
              ),
              vertical: BorderSide(
                width: 5,
                color: Colors.grey.shade600,
              ),
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
            color: Colors.transparent),
        child: Center(
          child: Text(
            itemTxt,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
