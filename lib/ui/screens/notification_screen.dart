import 'dart:math';

import 'package:clinical_pharmacist_intervention/ui/elements/notification_item.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 8.0, start: 8),
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
              SizedBox(
                width: 350,
                height: 50,
                child: EasySearchBar(
                    backgroundColor: Colors.white,
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
    );
  }
}


/**
  Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(12),
                            color: (isDark!) ? Colors.black : Colors.blue[300]),
                        child: 
                        
                        DropdownButton(
                          dropdownColor: Colors.blue[200],
                          hint: Text(
                            "hint",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                                  Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          focusColor:
                               Colors.black,
                          iconEnabledColor:
                             Colors.black,
                          value: list.item,
                          onChanged: (String? ch) {
                            
                          },
                          items: list
                              .map<DropdownMenuItem<String>>(
                            (type) {
                              return DropdownMenuItem<String>(
                                child: Row(),
                                value: item.statusText,
                              );
                            },
                          ).toList(),
                        ),
                      ),

 */