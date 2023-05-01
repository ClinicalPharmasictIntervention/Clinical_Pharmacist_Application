import 'package:clinical_pharmacist_intervention/shared/cubit/states.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static get(context) => BlocProvider.of<AppCubit>(context);

  void launchDialer({required String number}) async {
    final Uri url = Uri.parse('tel:$number');

    emit(DialerLoadingState());
    if (await canLaunchUrl(url)) {
      emit(DialerSuccessState());
      await launchUrl(url);
    } else {
      emit(DialerErrorState());
      throw 'Error occurred trying to call that number.';
    }
  }
}

void navigateTo(context, screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void showQuickAlert({
  context,
  alertType,
  dialogMessage,
  nextButtonTitle,
  backButtonTitle,
  actionTitle,
  onNext,
  onBack,
}) {
  QuickAlert.show(
    confirmBtnColor: secondaryColor,
    textColor: Colors.grey,
    context: context,
    type: alertType,
    text: dialogMessage,
    showCancelBtn: true,
    confirmBtnText: nextButtonTitle,
    cancelBtnText: backButtonTitle,
    title: actionTitle,
    onConfirmBtnTap: onNext,
    onCancelBtnTap: onBack,
  );
}
