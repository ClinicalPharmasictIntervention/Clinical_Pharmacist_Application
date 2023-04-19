import 'dart:math';

import 'package:clinical_pharmacist_intervention/ui/elements/notification_item.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              // title: Text("Profile"),
    
              backgroundColor: Colors.white,
              expandedHeight: MediaQuery.of(context).size.height * .15,
              collapsedHeight:MediaQuery.of(context).size.height * .1 ,
              floating: false,
              flexibleSpace: Padding(
                padding: const EdgeInsetsDirectional.only(top:60.0, start: 8, bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CircleAvatar(
                        
                        child: Image.asset("assets/images/avatar_doctor.png"),
                      ),
                    ),
              
                    const SizedBox(width: 10,),
                    Column(
                      children: const [
                        Text(
                          "name",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "id",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              )),

              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: Color.fromARGB(255, 140, 171, 196),
                leading: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 8.0, start: 8),
                child: SizedBox(
                 // height: 50,
                  width: 50,
                  child: Image.asset(
                    "assets/images/notification_filter.png",
                  ),
                ),
              ),
            ),

            leadingWidth: 50,
            actions: [
              SizedBox(
                width: 350,
                height: 50,
                child: EasySearchBar(
                backgroundColor: Color.fromARGB(255, 140, 171, 196),
                    title: Text("Reports"),
                    onSearch: (value) {}),
              ),
            ],
              ),
          SliverFixedExtentList(
            //key: Random.secure().nextInt(500).toString(),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const NotificationItem();
              },
              childCount: 10,
            ),
            itemExtent: 110,
          )
        ],
      ),
    );
  }
}
