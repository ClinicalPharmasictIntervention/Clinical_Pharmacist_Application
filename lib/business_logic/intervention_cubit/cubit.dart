import 'dart:io';

import 'package:clinical_pharmacist_intervention/business_logic/intervention_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class InterventionCubit extends Cubit<InterventionStates> {
  InterventionCubit() : super(InterventionInitialState());

  static get(context) => BlocProvider.of<InterventionCubit>(context);

  final ImagePicker picker = ImagePicker();
  File? pickedImage;

  Future<void> selectCameraAndGalleryPhoto({required ImageSource media}) async {
    final pickedFile = await picker.pickImage(source: media);

    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      emit(PhotoUploadSuccessState());
    } else {
      emit(PhotoUploadErrorState());
      print('No image selected');
    }
  }
}
