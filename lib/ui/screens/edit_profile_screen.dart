import 'package:clinical_pharmacist_intervention/business_logic/cubit/app_cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final enableEditingBodyKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: drawBody(context),
              floatingActionButton:( context.read<AppCubit>().editProfileAbsorbing==false)?null:
              
                  drawEnableEditingFloatingActionButton(context),
                  
            );
          }),
    );
  }

  drawBody(BuildContext context) {
   return AbsorbPointer(
      absorbing: (context.read<AppCubit>().editProfileAbsorbing == false)
          ? false
          : true,
      key: enableEditingBodyKey,
      child: Padding(
        padding: const EdgeInsetsDirectional.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  child: Image.asset("assets/images/avatar_doctor.png"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 22,
                  // color: Colors.blue,
                  //decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                labelTxt: "User name",
                hintTxt: "Please, enter at least 4 names.",
                prefixIcon: IconBroken.User,
                onTxtChange: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                labelTxt: "ID",
                hintTxt: "Your ID in this Hospital.",
                prefixIcon: IconBroken.Unlock,
                isEnabled: false,
                onTxtChange: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                  labelTxt: "E-Mail",
                  hintTxt: "ex: doctor17ahmed@cpi.com 😂🤭",
                  prefixIcon: IconBroken.Message,
                  txtInputType: TextInputType.emailAddress,
                  isEnabled: false,
                  onTxtChange: () {}),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                labelTxt: "Current Phone Number",
                hintTxt: "your current phone number",
                prefixIcon: IconBroken.Call,
                txtInputType: TextInputType.phone,
                isEnabled: false,
                onTxtChange: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                labelTxt: "Phone Number",
                hintTxt: "your current phone number",
                prefixIcon: IconBroken.Call,
                txtInputType: TextInputType.phone,
                onTxtChange: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: DefaultTextField(
                  labelTxt: "Click to Show current Password",
                  hintTxt: "Strong Password",
                  prefixIcon: IconBroken.Password,
                  txtInputType: TextInputType.visiblePassword,
                  isEnabled: false,
                  onTxtChange: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                  labelTxt: "New Password",
                  hintTxt: "Strong Password",
                  prefixIcon: IconBroken.Password,
                  txtInputType: TextInputType.visiblePassword,
                  onTxtChange: () {}),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                  labelTxt: "Confirm Password",
                  hintTxt: "typical Password",
                  prefixIcon: IconBroken.Password,
                  txtInputType: TextInputType.visiblePassword,
                  onTxtChange: () {}),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: PrimaryBtn(
                  btnTitle: "Confirm",
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
