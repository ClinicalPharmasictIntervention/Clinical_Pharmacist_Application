import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/data/models/notification_model.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_calindar_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_date_dialogue_actions.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/build_date_dialogue_title.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/notification_item.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/app_theme.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
        appBar: AppBar(
          leadingWidth: 0,
          title: Row(
            children: [
              const Icon(
                size: 30,
                IconBroken.Notification,
                color: Colors.black87,
              ),
              const SizedBox(
                width: 15.0,
              ),
              Text(
                'Notifications',
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
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading: BlocConsumer<AppCubit, AppState>(
                  listener: (BuildContext context, Object? state) {
                    if (state is ShowDateDialogueState) {
                      showDateDialogue(
                          context,
                          const BuildDateDialogueTitle(),
                          BuildCalendarItem(context),
                          const [BuildDateDialogueAction()]);
                    }
                  },
                  builder: (BuildContext context, state) {
                    return drawLeaddingSliverAppBar(context);
                  },
                ),
                leadingWidth: MediaQuery.of(context).size.width * .2,
                actions: [
                  BlocConsumer<AppCubit, AppState>(
                    listener: (BuildContext context, Object? state) {
                      if (state is ShowDateDialogueState) {}
                    },
                    builder: (BuildContext context, state) {
                      return drawEasySearchBar(context, "");
                    },
                  ),
                ],
              ),
              BlocConsumer<AppCubit, AppState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = AppCubit.get(context);
                  return SliverFixedExtentList(
                    //key: Random.secure().nextInt(500).toString(),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return NotificationItem(
                          notification: cubit.notifications[index],
                        );
                      },
                      childCount: cubit.notifications.length,
                    ),
                    itemExtent: 110,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawLeaddingSliverAppBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AppCubit>().showDateDialogue(context);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 8.0, start: 4),
        child: Image.asset(
          "assets/images/notification_filter.png",
        ),
      ),
    );
  }

  drawEasySearchBar(BuildContext context, String titleTxt) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: EasySearchBar(
          backgroundColor: Colors.transparent,
          //  foregroundColor: Colors.transparent,
          title: Text(titleTxt),
          onSearch: (value) {}),
    );
  }
}
