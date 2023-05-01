import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/bloc_observer.dart';
import 'package:clinical_pharmacist_intervention/shared/cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/choose_acount_type_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/on_boarding_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/reports_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/splash_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => ReportsCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: Lora,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: defaultColor,
            foregroundColor: Colors.black54,
          ),
        ),
        home: OnBoardingScreen(),
      ),
    );
  }
}
