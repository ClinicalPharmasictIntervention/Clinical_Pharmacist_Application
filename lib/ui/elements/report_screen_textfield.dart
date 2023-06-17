import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/src/widgets/framework.dart';

class ReportScreenTextField extends StatelessWidget {
  ReportScreenTextField({
    Key? key,
    required this.readOnly,
    required this.title,
    this.validate,
    this.controller,
    this.hintSize,
    this.keyboardType,
    this.onComplete, 
    this.onChange,
  }) : super(key: key);
  bool readOnly;
  String title;
  double? hintSize;
  var controller;
  var validate;
  var keyboardType;
  VoidCallback? onComplete;
  Function(String s)? onChange ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      
      validator: validate,
      readOnly: readOnly,
      keyboardType: keyboardType,
      onEditingComplete: onComplete,
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
        labelStyle: TextStyle(color: Colors.blue),
        label: !readOnly
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: hintSize,
                    fontFamily: Lora,
                    height: 1.5,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
