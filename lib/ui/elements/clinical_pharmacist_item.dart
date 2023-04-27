import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

class ClinicalPharmacistItem extends StatelessWidget {
  ClinicalPharmacistItem(
      {Key? key, required this.name, required this.department})
      : super(key: key);
  String name;
  String department;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(department, style: TextStyle(fontSize: 18)),
        leading: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                "assets/images/avatar_clinical_pharmacist.png",
              ),
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(color: Colors.grey.shade300),
            color: Colors.grey.shade300,
          ),
          width: 70,
          height: 100,
        ),
      ),
    );
  }
}
