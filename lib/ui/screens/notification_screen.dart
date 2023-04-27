import 'package:clinical_pharmacist_intervention/ui/elements/notification_item.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                leading: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 8.0, start: 8),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        "assets/images/notification_filter.png",
                      ),
                    ),
                  ),
                ),
                leadingWidth: 50,
                actions: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 350,
                    height: 50,
                    child: EasySearchBar(
                        backgroundColor: Colors.transparent,
                        //  foregroundColor: Colors.transparent,
                        title: Text("Notification"),
                        onSearch: (value) {}),
                  ),
                ],
              ),
              SliverFixedExtentList(
                //key: Random.secure().nextInt(500).toString(),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return NotificationItem();
                  },
                  childCount: 10,
                ),
                itemExtent: 110,
              )
            ],
          ),
        ),
      ),
    );
  }
}
