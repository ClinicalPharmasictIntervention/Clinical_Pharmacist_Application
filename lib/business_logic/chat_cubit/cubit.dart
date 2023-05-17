import 'package:clinical_pharmacist_intervention/business_logic/sign_in_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/business_logic/sign_up_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/data/models/clinical_pharmacist_model.dart';
import 'package:clinical_pharmacist_intervention/data/models/doctor_model.dart';
import 'package:clinical_pharmacist_intervention/shared/network/local/cache_helper.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static get(context) => BlocProvider.of<SignUpCubit>(context);

  void userSignUp({
    required String name,
    required String id,
    required String hospitalId,
    required String email,
    required String phoneNumber,
    required String password,
  }) {
    emit(SignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      token = value.user!.uid;
      createUser(
        name: name,
        id: token!,
        hospitalId: hospitalId,
        phoneNumber: phoneNumber,
        email: email,
      );

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

  void createUser({
    required String name,
    required String id,
    required String hospitalId,
    required String phoneNumber,
    required String email,
  }) {
    emit(CreateUserLoadingState());

    ClinicalPharmacistModel model = ClinicalPharmacistModel(
      name: name,
      id: id,
      hospitalId: hospitalId,
      phoneNumber: phoneNumber,
      email: email,
    );

    FirebaseFirestore.instance
        .collection('Pharmacists')
        .doc(id)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });

    // DoctorModel model = DoctorModel(
    //   name: name,
    //   id: id,
    //   department: 'ward',
    //   hospitalId: hospitalId,
    //   phoneNumber: phoneNumber,
    //   email: email,
    // );
    //
    // FirebaseFirestore.instance
    //     .collection('Physicians')
    //     .doc(id)
    //     .set(model.toMap())
    //     .then((value) {
    //   emit(CreateUserSuccessState());
    // }).catchError((error) {
    //   emit(CreateUserErrorState(error.toString()));
    // });
  }

  void updateUser({
    required String key,
    required String value,
  }) {
    emit(UpdateUserLoadingState());
    FirebaseFirestore.instance.collection('Pharmacists').doc(token).update({
      key: value,
    }).then((value) {
      emit(UpdateUserSuccessState());
    }).catchError((error) {
      emit(UpdateUserErrorState(error.toString()));
    });
  }
}
