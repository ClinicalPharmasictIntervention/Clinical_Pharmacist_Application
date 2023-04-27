import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReportScreenTextField extends StatelessWidget {
  ReportScreenTextField(
      {Key? key,
      required this.readOnly,
      required this.title,
      required this.hintSize})
      : super(key: key);
  bool readOnly;
  String title;
  double hintSize;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      style: const TextStyle(
        fontSize: 18,
        fontFamily: Lora,
      ),
      maxLines: 10,
      minLines: 1,
      decoration: InputDecoration(
        hintText: readOnly ? title : '',
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: hintSize,
          fontFamily: Lora,
        ),
        contentPadding: const EdgeInsetsDirectional.only(start: 15),
        border: InputBorder.none,
        label: !readOnly
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: hintSize,
                    fontFamily: Lora,
                  ),
                ),
              )
            : null,
      ),
    );
    ;
  }
}
