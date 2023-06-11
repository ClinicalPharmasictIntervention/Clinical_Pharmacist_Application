import 'package:clinical_pharmacist_intervention/business_logic/chat_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/chat_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailsScreen extends StatelessWidget {
  var messageController = TextEditingController();

  ChatDetailsScreen({
    required this.receiverId,
    required this.name,
    required this.drAppToken,
  });

  String receiverId;
  String name;
  String? drAppToken;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      ChatCubit.get(context).getMessages(receiverId: receiverId);
      return BlocConsumer<ChatCubit, ChatStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(
                    IconBroken.Arrow___Left_2,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/avatar_doctor.png',
                      ),
                      radius: 20,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      name,
                      style: txtTheme(context).headlineLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 30.0,
                            color: Colors.black87,
                            fontFamily: Lora,
                          ),
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent,
                bottomOpacity: 0.0,
                elevation: 0.0,
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var message = ChatCubit.get(context).messages[index];
                          if (message.senderId == token) {
                            return buildMyMessage(message);
                          } else {
                            return buildMessage(message);
                          }
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 15),
                        itemCount: ChatCubit.get(context).messages.length,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: messageController,
                              decoration: const InputDecoration(
                                hintText: 'type your message here...',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10.0),
                              ),
                            ),
                          ),
                          Container(
                            height: 50.0,
                            color: secondaryColor,
                            child: MaterialButton(
                              minWidth: 1.0,
                              onPressed: () {
                                sendNotify(
                                  title: 'Message for you..',
                                  body: 'some pharmacist chat with you',
                                  token: appToken,
                                );
                                ChatCubit.get(context).sendMessage(
                                  receiverId: receiverId,
                                  dateTime: DateTime.now().toString(),
                                  text: messageController.text,
                                );
                              },
                              child: const Icon(
                                IconBroken.Send,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget buildMessage(message) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          child: Text('${message.text}'),
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
            ),
          ),
        ),
      );

  Widget buildMyMessage(message) => Align(
        alignment: AlignmentDirectional.topEnd,
        child: Container(
          child: Text('${message.text}'),
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
          decoration: BoxDecoration(
            color: secondaryColor.withOpacity(0.2),
            borderRadius: const BorderRadiusDirectional.only(
              bottomStart: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
            ),
          ),
        ),
      );
}
