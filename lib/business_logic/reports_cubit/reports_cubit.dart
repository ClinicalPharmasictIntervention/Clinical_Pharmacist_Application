import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/reports_states.dart';
import 'package:clinical_pharmacist_intervention/data/models/clinical_pharmacist_model.dart';
import 'package:clinical_pharmacist_intervention/data/models/doctor_model.dart';
import 'package:clinical_pharmacist_intervention/data/models/drug_model.dart';
import 'package:clinical_pharmacist_intervention/shared/shared_variables.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportsCubit extends Cubit<ReportsStates> {
  ReportsCubit() : super(ReportsInitialState());

  static get(context) => BlocProvider.of<ReportsCubit>(context);

  /// **************************** START *******************************************

  /// **************************** STEP ONE *******************************************

  DoctorModel? doctor;
  ClinicalPharmacistModel? clinPharmacist; // after login
  String? residentName;
  int? residentGenderValue = 0;
  int? maleGenderValue = 1;
  int? femaleGenderValue = 0;

  String? residentAge;
  String? bedNumber;
  String? medicalRecordNumber;

  void setDoctor(DoctorModel? doctor) {
    this.doctor=doctor;
  }

  void setResidentName(String residentName) {
    residentNameController.text = residentName;
    this.residentName = residentName;
  }

  void setResidntGenderValue(int residentGenderValue) {
    if (this.residentGenderValue == 1) {
      this.residentGenderValue = 0;
    } else {
      this.residentGenderValue = 1;
    }
    //  this.residentGenderValue=this.residentGenderValue!;

    /* if (residentGenderValue == "male") {
      this.residentGenderValue = "male";
      maleGenderValue = 1;
      femaleGenderValue = 0;
    } else if (residentGenderValue == "female") {
      this.residentGenderValue = "female";
      maleGenderValue = 0;
      femaleGenderValue = 1;
    }
*/
    emit(ChangeResidentGenderValueState());
  }

  void setResidentAge(String residentAge) {
    this.residentAge = residentAge;
  }

  void setBedNumber(String bedNumber) {
    this.bedNumber = bedNumber;
  }

  void setMedicalRecordNumber(String medicalRecordNumber) {
    this.medicalRecordNumber = medicalRecordNumber;
  }

  /// **************************** STEP TWO *******************************************

  String? problemType;
  String? problemDescription;
  String? errorCategory;
  String? errorType;
  String? reference;

  void setProblemType(String problemType) {
    this.problemType = problemType;
  }

  void setProblemDescription(String problemDescription) {
    this.problemDescription = problemDescription;
  }

  void seterrorCategory(String errorCategory) {
    this.errorCategory = errorCategory;
  }

  void setErrorType(String errorType) {
    this.errorType = errorType;
  }

  void setReference(String reference) {
    this.reference = reference;
  }

  /// **************************** STEP THREE *******************************************

  String? interventionTxt;

  void setInterventionTxt(String interventionTxt) {
    this.interventionTxt = interventionTxt;
  }

  /// **************************** END ******************************************************

  /// **************************** INITIALIZATION *******************************************

  List<CoolDropdownItem<String>> problemTypesList = [
    CoolDropdownItem(
      label: '[Unnecessary Drug] There is no valid indication.',
      value: '[Unnecessary Drug] There is no valid indication.',
    ),
    CoolDropdownItem(
      label:
          '[Unnecessary Drug] Therapeutic Duplication \n (Multiple-drugs used for a condition that requires single-drug)',
      value:
          '[Unnecessary Drug] Therapeutic Duplication \n (Multiple-drugs used for a condition that requires single-drug)',
    ),
    CoolDropdownItem(
      label:
          '[Unnecessary Drug] The condition is more appropriately \n treated with non-drug therapy.',
      value:
          '[Unnecessary Drug] The condition is more appropriately \n treated with non-drug therapy.',
    ),
    CoolDropdownItem(
      label:
          '[Selection]  Allergy \n (drug is not the most appropriate due to known or potential allergy)',
      value:
          '[Selection]  Allergy \n (drug is not the most appropriate due to known or potential allergy)',
    ),
    CoolDropdownItem(
      label:
          '[Selection]  The selected drug is not the most effective for \n this condition according to guidelines or patient respons',
      value:
          '[Selection]  The selected drug is not the most effective for \n this condition according to guidelines or patient respons',
    ),
        CoolDropdownItem(
      label:
          '[Drug Interactions]  A drug interaction that may affect effectiveness or safety',
      value:
          '[Drug Interactions]  A drug interaction that may affect effectiveness or safety',
    ),

    CoolDropdownItem(
      label:
          '[Dosing Regimen]  Duration of drug therapy is not appropriate \n (too short/ long).',
      value:
          '[Dosing Regimen]  Duration of drug therapy is not appropriate \n (too short/ long).',
    ),
        CoolDropdownItem(
      label:
          '[Instructions for Prep./Adm.]  The Administration time may affect effectiveness or safety',
      value:
          '[Instructions for Prep./Adm.]  The Administration time may affect effectiveness or safety',
    ),
        CoolDropdownItem(
      label:
          '[Monitoring] The drug causes an undesirable effect/ unpredicted Allergic reaction \n (although initial appropriate selection and dosing)',
      value:
          '[Monitoring] The drug causes an undesirable effect/ unpredicted Allergic reaction \n (although initial appropriate selection and dosing)',
    ),

            CoolDropdownItem(
      label:
          '[Adherence]  The patient cannot swallow or self-administer the drug appropriately.',
      value:
          '[Adherence]  The patient cannot swallow or self-administer the drug appropriately.',
    ),
  ];

  List<CoolDropdownItem<String>> errorCategoriesList = [
    CoolDropdownItem(
      label: 'A (NO ERROR- Circumstances that may lead to error)',
      value: 'A (NO ERROR- Circumstances that may lead to error)',
    ),
    CoolDropdownItem(
      label: 'B (ACTUAL ERROR- PREVENTED Before Reaching The Patient)',
      value: 'B (ACTUAL ERROR- PREVENTED Before Reaching The Patient)',
    ),
    CoolDropdownItem(
      label: 'C (ERROR REACHED the patient- NO HARM)',
      value: 'C (ERROR REACHED the patient- NO HARM)',
    ),
    CoolDropdownItem(
      label:
          'D (Error Reached the patient- MONITORING was required to ensure NO HARM)',
      value:
          'D (Error Reached the patient- MONITORING was required to ensure NO HARM)',
    ),
    CoolDropdownItem(
      label:
          'E (Error Reached- Lead to TEMPORARY HARM that required intervention)',
      value:
          'E (Error Reached- Lead to TEMPORARY HARM that required intervention)',
    ),
    CoolDropdownItem(
      label:
          'F (Error Reached- Lead To TEMPORARY HARM that required prolonged HOSPITALIZATION)',
      value:
          'F (Error Reached- Lead To TEMPORARY HARM that required prolonged HOSPITALIZATION)',
    ),
    CoolDropdownItem(
      label: 'G (Error Reached- Lead To PERMANENT HARM)',
      value: 'G (Error Reached- Lead To PERMANENT HARM)',
    ),
    CoolDropdownItem(
      label:
          'H (Error Reached- Required Intervention Necessary to SUSTAIN LIFE)',
      value:
          'H (Error Reached- Required Intervention Necessary to SUSTAIN LIFE)',
    ),
    CoolDropdownItem(
      label: 'I (Error Reached- lead to patient DEATH)',
      value: 'I (Error Reached- lead to patient DEATH)',
    ),
  ];

  List<CoolDropdownItem<String>> errorTypesList = [
    CoolDropdownItem(
      label: '[Ordering Process o.p]  Wrong patient',
      value: '[Ordering Process o.p]  Wrong patient',
    ),
    CoolDropdownItem(
      label:
          '[Ordering Process o.p]  Wrong Drug Name',
      value:
          '[Ordering Process o.p]  Wrong Drug Name',
    ),
    CoolDropdownItem(
      label:
          '[Ordering Process o.p]  Unapproved Abbreviations',
      value:
          '[Ordering Process o.p]  Unapproved Abbreviations',
    ),

      CoolDropdownItem(
      label: '[Ordering Process o.p]  Repetition',
      value: '[Ordering Process o.p]  Repetition',
    ),
    CoolDropdownItem(
      label:
          '[Administration]  Nurse repeated administration of the same drug',
      value:
          '[Administration]  Nurse repeated administration of the same drug',
    ),
    CoolDropdownItem(
      label:
          '[Administration]  Wrong IV flow rate',
      value:
          '[Administration]  Wrong IV flow rate',
    ),
  ];

  TextEditingController residentNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bedController = TextEditingController();
  TextEditingController medicalController = TextEditingController();

  DropdownController problemTypeDropdownController = DropdownController();
  DropdownController errorCategoryDropdownController = DropdownController();

  DropdownController errorTypeDropdownController = DropdownController();
  TextEditingController problemDescController = TextEditingController();
  TextEditingController refrencesController = TextEditingController();

  TextEditingController interventionController = TextEditingController();

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
  int currentStep=0 ;
  bool isLastStep=false;

  void changeForwardStep() {
    currentStep++;
   isLastStep= (currentStep==2)? true:false;
    emit(ReportschangeForwardStep());
  }

  void changeBackwardStep() {
    currentStep--;
       isLastStep= (currentStep==2)? true:false;

    emit(ReportschangeBackwardStep());
  }

  changeCurrentStep(int value) {
    currentStep = value;
       isLastStep= (currentStep==2)? true:false;

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

  void addNewDrug() {
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

  void goTo(context, screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    emit(GoToNextStepState());
  }

  void goBack(BuildContext context) {
    Navigator.pop(context);
    emit(GoToBackStepState());
  }

  /******************************************************* Dio */
  Dio dio = Dio();

  Future<List> getDrugs() async {
    try {
      Response response = await dio.get("${baseUrl}v1/alldrugs/");

      final List list = response.data["data"]
          .map((drug) => DrugModel.fromJson(drug))
          .toList();
      emit(GetDrugsState(list));

      return list;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  List<String> problemTypes=[];


  



  Future<List> getErrorTypes() async {
    try {
      List? list = [];

      Response response = await dio.get("${baseUrl}v1/typeOfError");

      response.data["data"].forEach((errorType) {
        list.add(errorType["typeOfError"]);
      });
      emit(GetErrorTypeState(list));

      return list;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }


}
