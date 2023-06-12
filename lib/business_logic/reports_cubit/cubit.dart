import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportsCubit extends Cubit<ReportsStates> {

  ReportsCubit() : super(ReportsInitialState());

  static get(context) => BlocProvider.of<ReportsCubit>(context);

  TextEditingController residentNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bedController = TextEditingController();
  TextEditingController medicalController = TextEditingController();

  TextEditingController problemDescController = TextEditingController();
  TextEditingController refrencesController = TextEditingController();

  TextEditingController interventionController = TextEditingController();

  DropdownController problemTypeDropdownController = DropdownController();
  DropdownController errorCategoryDropdownController = DropdownController();
  DropdownController errorTypeDropdownController = DropdownController();

    List<CoolDropdownItem<String>> problemTypesList = [
    
     CoolDropdownItem(
      label: '[Unnecessary Drug] There is no valid indication.',
      value: '[Unnecessary Drug] There is no valid indication.',
    ),
        CoolDropdownItem(
      label: '[Unnecessary Drug] Therapeutic Duplication \n (Multiple-drugs used for a condition that requires single-drug)',
      value: '[Unnecessary Drug] Therapeutic Duplication \n (Multiple-drugs used for a condition that requires single-drug)',
    ), 
        CoolDropdownItem(
      label: '[Unnecessary Drug] The condition is more appropriately \n treated with non-drug therapy.',
      value: '[Unnecessary Drug] The condition is more appropriately \n treated with non-drug therapy.',
    ),
 
  ];

    List<CoolDropdownItem<String>> problemCategories = [
    
     CoolDropdownItem(
      label: '[Unnecessary Drug] There is no valid indication.',
      value: '[Unnecessary Drug] There is no valid indication.',
    ),
        CoolDropdownItem(
      label: '[Unnecessary Drug] Therapeutic Duplication \n (Multiple-drugs used for a condition that requires single-drug)',
      value: '[Unnecessary Drug] Therapeutic Duplication \n (Multiple-drugs used for a condition that requires single-drug)',
    ), 
        CoolDropdownItem(
      label: '[Unnecessary Drug] The condition is more appropriately \n treated with non-drug therapy.',
      value: '[Unnecessary Drug] The condition is more appropriately \n treated with non-drug therapy.',
    ),
 
  ];

    List<CoolDropdownItem<String>> errorTypesList = [
    
     CoolDropdownItem(
      label: '[Unnecessary Drug] There is no valid indication.',
      value: '[Unnecessary Drug] There is no valid indication.',
    ),
        CoolDropdownItem(
      label: '[Unnecessary Drug] Therapeutic Duplication \n (Multiple-drugs used for a condition that requires single-drug)',
      value: '[Unnecessary Drug] Therapeutic Duplication \n (Multiple-drugs used for a condition that requires single-drug)',
    ), 
        CoolDropdownItem(
      label: '[Unnecessary Drug] The condition is more appropriately \n treated with non-drug therapy.',
      value: '[Unnecessary Drug] The condition is more appropriately \n treated with non-drug therapy.',
    ),
 
  ];


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

  //Make Report Screen
  List<String> titles = [
    'Resident Info',
    'Problems',
    'Your Intervention',
  ];

  List<dynamic> icons = [
    IconBroken.Profile,
    IconBroken.Info_Circle,
    IconBroken.Edit,
  ];
  int currentStep = 0;

  void changeForwardStep() {
    currentStep++;
    emit(ReportschangeForwardStep());
  }

  void changeBackwardStep() {
    currentStep--;
    emit(ReportschangeBackwardStep());
  }

  changeCurrentStep(int value) {
    currentStep = value;
    print("vvvvvvvvvvvv$currentStep");
    emit(ReportsTappedStep());
  }

  bool isCompleted = false;

  int drugNumber = 1;

  List<String> drugs = [
    'Acetaminophen',
    'Acetylcysteine',
    'Actemra',
    'Actos',
    'Acyclovir',
    'Aldactone',
    'Alecensa',
    'Alendronate',
    'Glucotrol',
    'Glumetza',
    'Glutathione',
    'Glyburide',
    'Glycerin',
    'GlycoLax',
    'Glycopyrrolate',
    'Glyxambi',
    'Gocovri',
    'Modafinil',
    'Mometasone',
    'Montelukast',
    'Morphine',
    'Motrin',
  ];

  void updateNewDrug() {
    ++drugNumber;
    emit(ReportsUpdateNewDrug());
  }

  int selectedRadio = 0;
  int selectedRadio1 = 0;
  int selectedRadio2 = 0;

  void changeFirstRadioMode(value) {
    selectedRadio = value;
    emit(ReportsChangeFirstRadioMode());
  }

  void changeSecondRadioMode(value) {
    selectedRadio1 = value;
    emit(ReportsChangeSecondRadioMode());
  }

  void changeThirdRadioMode(value) {
    selectedRadio2 = value;
    emit(ReportsChangeThirdRadioMode());
  }

  void onAutoCompleteChanged() {
    emit(ReportsAutoCompleteChanged());
  }

  void validateFormFields() {
    emit(ReportsValidateFormFieldsState());
  }

  String? drAppId;

  // Firebase of reports
}
