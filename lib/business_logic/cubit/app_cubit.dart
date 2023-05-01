import 'package:bloc/bloc.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  bool editProfileAbsorbing = false;

  AppCubit() : super(AppInitial());

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
}
