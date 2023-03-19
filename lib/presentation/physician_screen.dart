import 'package:clinical_pharmacist_intervention/shared/cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhysicianScreen extends StatelessWidget {
  const PhysicianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: TextButton(
            child: const Center(
              child: Text('Call'),
            ),
            onPressed: () {
              cubit.launchDialer(number: '01289575004');
            },
          ),
        );
      },
    );
  }
}
