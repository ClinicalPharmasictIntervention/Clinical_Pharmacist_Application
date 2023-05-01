import 'package:clinical_pharmacist_intervention/business_logic/sign_in_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/business_logic/sign_up_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/shared/network/local/cache_helper.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static get(context) => BlocProvider.of<SignUpCubit>(context);

  void userSignUp({
    required String userName,
    required String id,
    required String hospitalID,
    required String email,
    required String phone,
    required String password,
  }) {
    emit(SignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      token = FirebaseAuth.instance.currentUser!.uid;
      print(token);
      CacheHelper.savaDate(key: 'token', value: token).then((value) {
        emit(SignUpSuccessState());
      });
    }).catchError((error) {
      emit(SignUpErrorState(error));
    });
  }

  void validateFields() {
    emit(SignUpValidateFieldsState());
  }
}
