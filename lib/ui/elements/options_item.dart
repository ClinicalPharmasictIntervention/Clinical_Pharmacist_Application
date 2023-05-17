import 'dart:ui';

import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OptionsItem extends StatelessWidget {
  OptionsItem(
      {Key? key,
      required this.phoneNumber,
      required this.email,
      required this.chatId})
      : super(key: key);
  String phoneNumber;
  String email;
  String chatId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //call
              BlocConsumer<AppCubit, AppState>(
                listener: (context, state) {
                },
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context.read<AppCubit>().startSystemAudioCall(phoneNumber);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.pink.shade400,
                            Colors.pink.shade300,
                            Colors.pink.shade200
                          ]),
                          color: Colors.pink[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7.0))),
                      width: 140,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("call", style: TextStyle(fontSize: 24)),
                          Icon(
                            IconBroken.Call,
                            size: 22,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            const  SizedBox(
                width: 10,
              ),
              //chat
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.blue.shade400,
                        Colors.blue.shade300,
                        Colors.blue.shade200
                      ]),
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  width: 140,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("chat", style: TextStyle(fontSize: 24)),
                      Icon(
                        IconBroken.Chat,
                        size: 22,
                      )
                    ],
                  ),
                ),
              ),

              //contradiction
            ],
          ),
        const  SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.purple.shade400,
                    Colors.purple.shade300,
                    Colors.purple.shade200
                  ]),
                  color: Colors.blue[300],
                  borderRadius: const BorderRadius.all(Radius.circular(7.0))),
              width: 300,
              height: 50,
              child: GestureDetector(
                onTap: (){
                  context.read<AppCubit>().sendContradiction("dev.cs.mohamed@gmail.com", "mo17amer@gmail.com", "Mohamed H");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Make a contradiction", style: TextStyle(fontSize: 22)),
                    Icon(
                      IconBroken.Danger,
                      size: 22,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
