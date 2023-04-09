import 'package:clinical_pharmacist_intervention/business_logic/intervention_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/intervention_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/shared/cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhysicianScreen extends StatelessWidget {
  const PhysicianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InterventionCubit, InterventionStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return const Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Text('Physician Screen'),
          ),
        );
      },
    );
  }
}
