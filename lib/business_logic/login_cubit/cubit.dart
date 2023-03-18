import 'package:clinical_pharmacist_intervention/business_logic/login_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/login_cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static get(context) => BlocProvider.of<LoginCubit>(context);

  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState(error));
    });
  }
}
