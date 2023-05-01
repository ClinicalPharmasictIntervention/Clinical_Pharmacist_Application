import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

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

ShowDateDialogue(BuildContext context) async {
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
        title: drawDialogueTitle(context),
        content: drawDialogueContent(context),
        actions: drawDialogueActions(context),
      );
    },
  );
}

drawDateTime(BuildContext context) {
  return DateTimePicker(
    enableSuggestions: true,
    cursorColor: Colors.deepOrange,
    decoration: const InputDecoration(
      fillColor: Colors.deepOrange,
      focusColor: Colors.deepOrange,
      hoverColor: Colors.amber,
      iconColor: Colors.deepOrange,
    ),
    calendarTitle: "Select a Date to filter",
    type: DateTimePickerType.date,
    dateMask: 'd MMM, yyyy',
    icon: const Icon(Icons.event),
    dateLabelText: 'Search for',
    initialValue: DateTime.now().toString(),
    firstDate: DateTime(2023),
    lastDate: DateTime(2100),
    onChanged: (selectedDate) {
      context.read<AppCubit>().setFilterDate(selectedDate);
      context.read<AppCubit>().filterNotifications(selectedDate);

      print(selectedDate + selectedDate.runtimeType.toString());
    },
    validator: (value) {
      if (value!.isEmpty)
        return 'required';
      else {
        return null;
      }
    },
  );
}

drawDialogueTitle(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/background.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: 20,
        ),
        Text("  Press to select date"),
      ],
    ),
  );
}

drawDialogueContent(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/background.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: drawDateTime(context),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    ),
  );
}

drawDialogueActions(BuildContext context) {
  return [
    Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: TextButton(
              child: const Text('Search'),
              onPressed: () {
                Navigator.of(context).pop();
                context.read<AppCubit>().searchInNotifications(
                    context.read<AppCubit>().filterDate!);
              },
            ),
          ),
        ),
      ],
    ),
  ];
}

drawEnableEditingFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: Colors.blue,
    onPressed: () {
      context.read<AppCubit>().changeBodyAbsorbingValue(false);
    },
    child: const Icon(
      Icons.edit,
      color: Colors.blue,
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
