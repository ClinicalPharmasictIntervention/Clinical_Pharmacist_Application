import 'package:flutter/material.dart';
class BuildDateDialogueTitle extends StatelessWidget {
  const BuildDateDialogueTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/background.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: 20,
        ),
        Text("  Select  Date"),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
  }
}