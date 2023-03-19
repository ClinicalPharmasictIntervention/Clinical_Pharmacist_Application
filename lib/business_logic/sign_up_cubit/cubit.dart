import 'package:clinical_pharmacist_intervention/business_logic/sign_up_cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static get(context) => BlocProvider.of<SignUpCubit>(context);

  void userSignUp({required String email, required String password}) {
    emit(SignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(SignUpSuccessState());
    }).catchError((error) {
      emit(SignUpErrorState(error));
    });
  }
}
