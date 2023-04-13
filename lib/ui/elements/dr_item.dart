import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrItem extends StatelessWidget {
  DrItem({Key? key, required this.name, required this.department})
      : super(key: key);
  String name;
  String department;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(name),
      subtitle: Text(department),
      leading: ,

    );
  }
}
