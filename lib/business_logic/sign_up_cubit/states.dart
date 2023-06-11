abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  String error;
  SignUpErrorState(this.error);
}

class CreateUserLoadingState extends SignUpStates {}

class CreateUserSuccessState extends SignUpStates {}

class CreateUserErrorState extends SignUpStates {
  String error;
  CreateUserErrorState(this.error);
}

class UpdateUserLoadingState extends SignUpStates {}

class UpdateUserSuccessState extends SignUpStates {}

class UpdateUserErrorState extends SignUpStates {
  String error;
  UpdateUserErrorState(this.error);
}

class SignUpValidateFieldsState extends SignUpStates {}
