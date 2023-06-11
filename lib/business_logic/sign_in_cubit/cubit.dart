import 'package:clinical_pharmacist_intervention/business_logic/sign_in_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/shared/network/local/cache_helper.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());

  static get(context) => BlocProvider.of<SignInCubit>(context);

  void userSignIn({
    required String email,
    required String password,
  }) {
    emit(SignInLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);

      CacheHelper.savaDate(key: 'token', value: value.user!.uid);
      token = value.user!.uid;
      emit(SignInSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SignInErrorState(error.toString()));
    });
  }

  void validateFields() {
    emit(SignInValidateFieldsState());
  }
}
