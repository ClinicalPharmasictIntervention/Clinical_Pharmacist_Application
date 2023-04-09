import 'package:clinical_pharmacist_intervention/business_logic/intervention_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/bloc_observer.dart';
import 'package:clinical_pharmacist_intervention/shared/cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/on_boarding_screen.dart';
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
        home: OnBoardingScreen(),
      ),
    );
  }
}

ThemeData appTheme(BuildContext context) {
  return Theme.of(context);
}

TextTheme txtTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}
