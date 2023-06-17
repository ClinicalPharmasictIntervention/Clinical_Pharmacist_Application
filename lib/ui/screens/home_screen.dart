import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/data/models/charts_models.dart';
import 'package:clinical_pharmacist_intervention/data/repository/repo.dart';
import 'package:clinical_pharmacist_intervention/data/web_services/dio_helper.dart';
import 'package:clinical_pharmacist_intervention/shared/shared_variables.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_analogue_clock.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_c_calendar.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/home_main_elements.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/profile_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MonthlyChartData = [
    MonthlyChartModel("Jun", 20),
    MonthlyChartModel("Feb", 23),
    MonthlyChartModel("Mar", 29),
    MonthlyChartModel("April", 30),
  ];

  bool? playNotificationSound = true;
  AssetsAudioPlayer? assetsAudioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    assetsAudioPlayer = AssetsAudioPlayer();


    super.initState();
  }

  @override
  void dispose() {
    assetsAudioPlayer!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: drawAppBar(context),
        body: Column(
          children: [
            drawSafeArea(context),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                height: 3,
                color: Colors.grey,
                thickness: 1.5,
              ),
            ),
            Expanded(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //left
                    Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              drawContainerItem(
                                child: drawClockContainer(context),
                                color: Colors.blue,
                                height: 200,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.pink.shade400,
                                    Colors.pink.shade300,
                                    Colors.pink.shade200
                                  ],
                                ),
                              ),
                              drawContainerItem(
                                child: drawDateContainer(context),
                                color: Colors.deepOrange,
                                height: 300,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.deepOrange.shade400,
                                    Colors.deepOrange.shade300,
                                    Colors.deepOrange.shade200,
                                  ],
                                ),
                              ),
                              drawContainerItem(
                                child: drawPledgeContainer(context),
                                color: Colors.purple,
                                height: 150,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.purple.shade400,
                                    Colors.purple.shade300,
                                    Colors.purple.shade200,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    //right
                    Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              drawContainerItem(
                                child: drawChartContainer(context),
                                color: Colors.blue,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue.shade400,
                                    Colors.blue.shade300,
                                    Colors.blue.shade200
                                  ],
                                ),
                                height: 300,
                              ),
                              drawContainerItem(
                                child: drawStatusConterContainer(context),
                                color: Colors.green,
                                height: 260,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green.shade400,
                                    Colors.green.shade300,
                                    Colors.green.shade200,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ))
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  static List<charts.Series<MonthlyChartModel, String>> drawChart(
      dynamic data) {
    return [
      charts.Series<MonthlyChartModel, String>(
        data: data!,
        id: "",
        colorFn: (_, __) => charts.MaterialPalette.black,
        domainFn: (MonthlyChartModel acm, _) => acm.year,
        measureFn: (MonthlyChartModel acm, _) => acm.value,
      )
    ];
  }

  drawSafeArea(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 12,
        horizontal: 8,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProfileScreen();
                    },
                  ),
                );
                setState(() {});
              },
              child: CircleAvatar(
                child: Image.asset("assets/images/avatar_doctor.png"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.refresh,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    playNotificationSound = !playNotificationSound!;
                    setState(() {});
                  },
                  child: Icon(
                    (playNotificationSound == true)
                        ? Icons.notifications_on_outlined
                        : Icons.notifications_off_outlined,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  drawChartContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: CircleAvatar(
                  child: Image.asset(
                      "assets/images/notification_recommendation.png"),
                ),
              ),
              const Text(
                "Last 5 Monthes",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Expanded(
            child: charts.BarChart(
              drawChart(MonthlyChartData),
              animate: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "The most interaction month",
          ),
          const SizedBox(
            height: 7,
          ),
          const Text(
            "April 2023",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  drawClockContainer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BuildAnalogueClock(),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Clock Now",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  drawStatusConterContainer(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Attetion, Please!!!!",
            style: TextStyle(
              fontSize: 18,
              //  color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 120,
            width: 120,
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text(
                "50",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Pending Interventions",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "5 ACC",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "50 PEN",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "3 Rej",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  drawDateContainer(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: SizedBox(
              child: BuildCCalendar(),
            ),
          ),
        ],
      ),
    );
  }

  drawPledgeContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 5,
            width: MediaQuery.of(context).size.width,
          ),
          Expanded(
            child: CircleAvatar(
              radius: 50.0,
              child: IconButton(
                alignment: AlignmentDirectional.center,
                padding: EdgeInsets.zero,
                icon: Icon(
                  _isPlaying ? Icons.pause_circle : Icons.play_circle,
                  size: 36,
                ),
                onPressed: () {
                  if (_isPlaying == true) {
                    setState(() {
                      assetsAudioPlayer!.pause();
                      _isPlaying = false;
                    });
                  } else {
                    setState(() {});
                    _isPlaying = true;

                    playSoundAsset(
                      assetsAudioPlayer!,
                      "assets/sounds/dr_pledge.mp3",
                    );

                    printToast("Enjoy the Physician Pledge",
                        color: Colors.pinkAccent);
                    Timer(Duration(seconds: 4), () {
                      printToast("🌸🌸🌸🌹🌹🍓🍓",
                          color: Colors.deepPurpleAccent);
                    });
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Surprise",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
          const Text(
            "🙈🙈🙈🙈🙈🙈",
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  drawAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 0,
      title: Row(
        children: [
          const Icon(
            IconBroken.Home,
            color: Colors.black,
            size: 30,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            'Home',
            style: txtTheme(context).headlineLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                  color: Colors.black87,
                  fontFamily: Lora,
                ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }
}
