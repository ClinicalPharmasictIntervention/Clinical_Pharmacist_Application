import 'dart:convert';

import 'package:clinical_pharmacist_intervention/business_logic/chat_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/data/models/message_model.dart';
import 'package:clinical_pharmacist_intervention/data/models/notification_model.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static get(context) => BlocProvider.of<ChatCubit>(context);

  void sendMessage({
    required receiverId,
    required dateTime,
    required text,
  }) {
    MessageModel model = MessageModel(
      senderId: token,
      receiverId: receiverId,
      text: text,
      dateTime: dateTime,
    );

    //set my chat
    FirebaseFirestore.instance
        .collection('Pharmacists')
        .doc(token)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(ChatSendMessageSuccessState());
    }).catchError((error) {
      emit(ChatSendMessageErrorState());
    });

    //set receiver chat
    FirebaseFirestore.instance
        .collection('Physicians')
        .doc(receiverId)
        .collection('chats')
        .doc(token)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(ChatSendMessageSuccessState());
    }).catchError((error) {
      emit(ChatSendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    required receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('Pharmacists')
        .doc(token)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(ChatGetMessagesSuccessState());
    });
  }

  //Notifications
}
