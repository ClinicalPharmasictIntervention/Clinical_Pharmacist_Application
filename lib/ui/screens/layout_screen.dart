import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/reports_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/discuss_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/dr_list_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/home_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/notification_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/profile_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  List<Widget> screens = [
    HomeScreen(),
    ReportsScreen(),
    NotificationScreen(),
    DrDiscussionScreen(),
    ProfileScreen(),
  ];

  int currentIndex = 0;

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
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          selectedItemColor:Colors.white,
          showUnselectedLabels: true,
          elevation: 20,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(IconBroken.Home),
            ),
            BottomNavigationBarItem(
              label: 'Reports',
              icon: Icon(IconBroken.Document),
            ),
            BottomNavigationBarItem(
              label: 'Notifications',
              icon: Icon(IconBroken.Notification),
            ),
            BottomNavigationBarItem(
              label: 'Physicians',
              icon: Icon(IconBroken.Chat),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(IconBroken.Profile),
            ),
          ],
        ),
      ),
    );
  }
}
