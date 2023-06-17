import 'package:cool_dropdown/models/cool_dropdown_item.dart';

abstract class ReportsStates {}

class ReportsInitialState extends ReportsStates {}

class ReportsFilterChipChanged extends ReportsStates {}

class ReportschangeForwardStep extends ReportsStates {}

class ReportschangeBackwardStep extends ReportsStates {}

class ReportsTappedStep extends ReportsStates {}

class ReportsUpdateNewDrug extends ReportsStates {}

class ReportsChangeFirstRadioMode extends ReportsStates {}

class ReportsChangeSecondRadioMode extends ReportsStates {}

class ReportsChangeThirdRadioMode extends ReportsStates {}

class ReportsAutoCompleteChanged extends ReportsStates {}

class ReportsValidateFormFieldsState extends ReportsStates {}
class ChangeResidentGenderValueState extends ReportsStates{}
class GoToNextStepState extends ReportsStates{}
class GoToBackStepState extends ReportsStates{}

class GetDrugsState extends ReportsStates{
    final List<dynamic> drugs;
    GetDrugsState(this.drugs);
}
class GetProblemTypeState
 extends ReportsStates{
    final List problemTypes;
    GetProblemTypeState
(this.problemTypes);
}


class FillProblemTypeState
 extends ReportsStates{
    final List<CoolDropdownItem<String>> problemTypes;
    FillProblemTypeState (this.problemTypes);
}


class GeterrorCategoryState
 extends ReportsStates{
    final List<dynamic> errorCategory;
    GeterrorCategoryState
(this.errorCategory);
}

class GetErrorTypeState
 extends ReportsStates{
    final List<dynamic> errorTypes;
    GetErrorTypeState
(this.errorTypes);
}




