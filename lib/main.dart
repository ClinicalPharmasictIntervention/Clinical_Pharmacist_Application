import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/intervention_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/bloc_observer.dart';

import 'package:clinical_pharmacist_intervention/ui/screens/profile_screen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => InterventionCubit()),
      ],
      child: const MaterialApp(
        home: ProfileScreen(),
      ),
    );
  }
  
  
}
