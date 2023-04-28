import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportsCubit extends Cubit<ReportsStates> {
  ReportsCubit() : super(ReportsInitialState());

  static get(context) => BlocProvider.of<ReportsCubit>(context);

  var acceptSelected = secondaryColor;
  var pendingSelected = Colors.grey[400];
  var rejectedSelected = Colors.grey[400];

  void changeFilterChip({required String stateType}) {
    if (stateType == 'Accepted') {
      acceptSelected = secondaryColor;
      pendingSelected = rejectedSelected = Colors.grey[400];
    } else if (stateType == 'Pending') {
      pendingSelected = secondaryColor;
      acceptSelected = rejectedSelected = Colors.grey[400]!;
    } else {
      acceptSelected = pendingSelected = Colors.grey[400]!;
      rejectedSelected = secondaryColor;
    }
    emit(ReportsFilterChipChanged());
  }
}
