import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ClicableText extends StatelessWidget {
  ClicableText({Key? key, required this.txt, required this.onPressed})
      : super(key: key);
  String txt;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed(),
      child: Text(
        txt,
        style: const TextStyle(
            fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }
}
