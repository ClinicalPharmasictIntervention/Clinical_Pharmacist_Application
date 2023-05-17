import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildDateDialogueAction extends StatelessWidget {
  const BuildDateDialogueAction({super.key});

  @override
   build(BuildContext context) {
    return  
    Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: TextButton(
              child: const Text('Search'),
              onPressed: () {
                Navigator.of(context).pop();
                context.read<AppCubit>().searchInNotifications(
                    context.read<AppCubit>().filterDate!);
              },
            ),
          ),
        ),
      ],
    )
  ;
  }
}