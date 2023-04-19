import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            child: ListTile(
              leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                      "assets/images/notification_recommendation.png")),
              title: Text("From"),
              subtitle: Text("about"),
              isThreeLine: false,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text(DateTime.now().toString()), Text("need action")],
          ),
        ],
      ),
    );
  }
}
