import 'package:bloc/bloc.dart';
import 'package:clinical_pharmacist_intervention/data/models/clinical_pharmacist_model.dart';
import 'package:clinical_pharmacist_intervention/data/models/doctor_model.dart';
import 'package:clinical_pharmacist_intervention/data/models/notification_model.dart';
import 'package:clinical_pharmacist_intervention/data/web_services/dio_helper.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  bool editProfileAbsorbing = true;

  AppCubit() : super(AppInitial());

  static get(context) => BlocProvider.of<AppCubit>(context);

  startSystemAudioCall(String phoneNumber, {Map<String, dynamic>? qp}) async {
    try {
      final url = Uri(scheme: "tel", path: phoneNumber, queryParameters: qp);
      //  if (await canLaunchUrl(url)) { }
      launchUrl(
        url,
      );
    } catch (e) {
      printToast("Please, check Sys DAIL");
      print(e.toString());
      rethrow;
    }

    emit(StartCallState());
  }

  sendContradiction(String managerEmail, String aboutEmail, String aboutName,
      {Map<String, dynamic>? qp}) async {
    try {
      final url = Uri(
          scheme: "mailto",
          path: managerEmail,
          queryParameters: (<String, String>{
            'subject': 'concerning $aboutName, his/her e-mail is $aboutEmail  ',
            'body': "مطلع عيني، لو سمحت شوف مشكلته 😂😡 "
          }));
      //  if (await canLaunchUrl(url)) { }
      launchUrl(
        url,
      );
    } catch (e) {
      printToast("Check Internet Connection");
      print(e.toString());
      rethrow;
    }
    emit(SendContradictionState());
  }

  goTo(BuildContext context, dynamic screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );

    emit(NavigationState());
  }

  DateTime? filterDateTime;
  String? filterTime;
  String? filterDate = DateTime.now().toString().substring(0, 11);

  setFilterDate(String selectedDate) {
    filterDate = selectedDate;
  }

  searchInNotifications(String searchedString) {}

  searchInProfileReports(String searchedString) {}

  filterNotifications(String selectedDate) {}

  filterProfileReports(String selectedDate) {}

  showDateDialogue(BuildContext context) async {
    emit(ShowDateDialogueState());
  }

  void changeBodyAbsorbingValue(bool absorbing) {
    editProfileAbsorbing = absorbing;
    emit(EnableEditProfileState());
  }

  NotificationModel? notificationModel;

  void sendNotificationData({
    required physicianName,
    required receiverId,
    required patientName,
    required status,
    type,
  }) {
    notificationModel = NotificationModel(
      physicianName: physicianName,
      patientName: patientName,
      date:
          '${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}',
      time:
          '${DateTime.now().hour.toString()} : ${DateTime.now().minute.toString()}',
      status: status,
      type: 'recommendation',
    );

    // FirebaseFirestore.instance
    //     .collection('Pharmacists')
    //     .doc(token)
    //     .collection('notificationCenter')
    //     .doc('BooFjMVX3eXrrY5ZglvBm2TJT1g2')
    //     .collection('notifications')
    //     .add(notificationModel!.toMap())
    //     .then((value) {
    //   emit(SendNotificationSuccessState());
    // }).catchError((error) {
    //   emit(SendNotificationErrorState());
    // });

    FirebaseFirestore.instance
        .collection('Physicians')
        .doc(receiverId)
        .collection('notificationCenter')
        .doc(token)
        .collection('notifications')
        .add(notificationModel!.toMap())
        .then((value) {
      emit(SendNotificationSuccessState());
    }).catchError((error) {
      emit(SendNotificationErrorState());
    });
  }

  Map<String, dynamic> notificationsId = {};

  void getNotificationsId() {
    FirebaseFirestore.instance
        .collection('Pharmacists')
        .doc(token)
        .collection('notificationCenter')
        .snapshots()
        .listen((event) {
      notificationsId = {};
// experenment code
      event.docs.forEach((element) {
        notificationsId.addAll(element.data());
      });
    });
  }

  List<NotificationModel> notifications = [];

  void getNotifications() {
    getNotificationsId();

    //get all notifications
    FirebaseFirestore.instance
        .collection('Pharmacists')
        .doc(token)
        .collection('notificationCenter')
        .doc('BooFjMVX3eXrrY5ZglvBm2TJT1g2')
        .collection('notifications')
        .snapshots()
        .listen((event) {
      notifications = [];

      event.docs.forEach((e) {
        notifications.add(NotificationModel.fromJson(e.data()));
      });
      emit(GetNotificationSuccessState());
    });
  }

  // get clinical pharmacists data

  ClinicalPharmacistModel? clinicalPharmacistModel;

  void getPharmacistData() {
    emit(GetPharmacistLoadingState());

    FirebaseFirestore.instance
        .collection('Pharmacists')
        .doc(token)
        .get()
        .then((value) {
      clinicalPharmacistModel = ClinicalPharmacistModel.fromJson(value.data());

      print(value.id);
      pharmacistModel = clinicalPharmacistModel!;
      emit(GetPharmacistSuccessState());
    }).catchError((error) {
      emit(GetPharmacistErrorState());
      print(error.toString());
    });
  }

  List physicians = [];

  void getPhysicianData() {
    emit(GetPhysiciansLoadingState());

    FirebaseFirestore.instance.collection('Physicians').get().then((value) {
      value.docs.forEach((element) {
        physicians.add(
          DoctorModel.fromJson(element.data()),
        );
      });
      emit(GetPhysiciansSuccessState());
    }).catchError((error) {
      emit(GetPhysiciansErrorState());
      print(error.toString());
    });
  }


  getData({String? path, Map<String, dynamic>? queryParameter, List? storeList}){
    DioHelper.getData(path: path, storeList: storeList ).then((value) => print(value));

    emit(getDataState());
  }
}
