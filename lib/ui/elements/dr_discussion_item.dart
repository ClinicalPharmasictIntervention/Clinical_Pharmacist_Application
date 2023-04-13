
import 'package:flutter/material.dart';

class DrDiscussionItem extends StatelessWidget {
  DrDiscussionItem({
    Key? key,
    required this.name,
    required this.department,

  }) : 
  super(key: key);
  String name;
  String department;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: EdgeInsetsDirectional.all(4.0),
        decoration: BoxDecoration(
             border: Border.all(width: 3, color: Colors.blue, strokeAlign: BorderSide.strokeAlignInside),
       // borderRadius: BorderRadius.all(Radius.circular(5), ),color: Colors.black, 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DrItem(name: name, department: department),
            DiscussionItem()
          ],
        ),
      ),
    );
 }
}

