import 'package:clinical_pharmacist_intervention/business_logic/intervention_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/intervention_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/shared/cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PhysicianScreen extends StatelessWidget {
  const PhysicianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InterventionCubit, InterventionStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = InterventionCubit.get(context);
        return Scaffold(
          body: TextButton(
            child: const Center(
              child: Text('Upload Photo'),
            ),
            onPressed: () {
              cubit.selectCameraAndGalleryPhoto(media: ImageSource.gallery);
            },
          ),
        );
      },
    );
  }
}
