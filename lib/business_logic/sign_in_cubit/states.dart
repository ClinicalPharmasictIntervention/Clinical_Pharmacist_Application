abstract class SignInStates {}

class SignInInitialState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInSuccessState extends SignInStates {}

class SignInErrorState extends SignInStates {
  String error;
  SignInErrorState(this.error);
}

class SignInValidateFieldsState extends SignInStates {}