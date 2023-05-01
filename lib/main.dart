import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/sign_in_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/sign_up_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/bloc_observer.dart';
import 'package:clinical_pharmacist_intervention/shared/cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/network/local/cache_helper.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/layout_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/login_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/on_boarding_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/register_screen.dart';
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
  await CacheHelper.init();

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  String? uId = CacheHelper.getData(key: 'token');

  if (onBoarding != null) {
    if (onBoarding == true) {
      startWidget = OnBoardingScreen();
    } else {
      startWidget = SplashScreen();
    }
  } else {
    startWidget = OnBoardingScreen();
  }

  if (uId == null) {
    homeOrRegisterWidget = SignUpScreen();
  } else {
    homeOrRegisterWidget = LayoutScreen();
  }
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
        BlocProvider(create: (context) => SignInCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: Lora,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: defaultColor,
            foregroundColor: Colors.black54,
          ),
        ),
        home: startWidget,
      ),
    );
  }
}
