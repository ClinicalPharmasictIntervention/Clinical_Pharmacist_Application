import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_calindar_item.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;


printToast(String? msg, {Toast? toastLenght}) {
  Fluttertoast.showToast(
    msg: msg!,
    toastLength: (toastLenght == null) ? Toast.LENGTH_SHORT : toastLenght,
    gravity: ToastGravity.BOTTOM,
    // timeInSe20cForIos: 1,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.deepOrange,
    textColor: Colors.black,
    fontSize: 20,
  );
}

showDateDialogue(BuildContext context, Widget title, Widget content, List<Widget> actions)async{
ShowCustomDialogue(context, title, content, actions);
}


ShowCustomDialogue(BuildContext context, Widget title, Widget content, List<Widget> actions) async {
  showDialog<void>(
    useSafeArea: true,
    context: context,

    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 3.0,
        scrollable: true,
        
        titlePadding: EdgeInsetsDirectional.zero,
        contentPadding: EdgeInsetsDirectional.zero,
        actionsPadding: EdgeInsetsDirectional.zero,
        buttonPadding: EdgeInsetsDirectional.zero,
        title: title,
        content: content,
        actions: actions,
      );
    },
  );
}


drawEnableEditingFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: Colors.blue,
    onPressed: () {
      context.read<AppCubit>().changeBodyAbsorbingValue(false);
    },
    child: const Icon(
      Icons.edit,
      color: Colors.black,
    ),
  );
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

drawDropDownList(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        color: Colors.blue[300]),
    child: DropdownButton(
      dropdownColor: Colors.blue[200],
      hint: Text(
        '  Choose our Department ',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      iconEnabledColor: Colors.black,
      value: "",
      onChanged: (String? ch) {},
      items: ["1","2","3"].map<DropdownMenuItem<String>>(
        (department) {
          return const DropdownMenuItem<String>(
            value: "",
            child: Text(
                  '',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
          );
        },
      ).toList(),
    ),
  );
}

