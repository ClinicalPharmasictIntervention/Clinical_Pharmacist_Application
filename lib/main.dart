import 'package:clinical_pharmacist_intervention/business_logic/chat_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/reports_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/sign_in_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/sign_up_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/bloc_observer.dart';
import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/network/local/cache_helper.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/layout_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/on_boarding_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/register_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/splash_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> backgroundMessage(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await CacheHelper.init();
  FirebaseMessaging.onBackgroundMessage(backgroundMessage);

  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    if (message.notification!.title == 'Intervention Request') {
      isNotification = true;
      isChat = false;
    } else {
      isNotification = false;
      isChat = true;
    }
    print('katim');
  });

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((event) {
    print(event.notification!.title);
  });

  FirebaseMessaging.instance.getToken().then((value) {
    appToken = value;
    print(value);
  });

  startWidget = OnBoardingScreen();
  homeOrRegisterWidget = SplashScreen();
  if (onBoarding == true) {
    if (token == null) {
      homeOrRegisterWidget = SignUpScreen();
    } else {
      homeOrRegisterWidget = LayoutScreen();
    }
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
            ..getPharmacistData()
            ..getPhysicianData()
            ..getNotifications(),
        ),
        BlocProvider(create: (context) => ReportsCubit()),
        BlocProvider(create: (context) => SignInCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => ChatCubit()),
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
