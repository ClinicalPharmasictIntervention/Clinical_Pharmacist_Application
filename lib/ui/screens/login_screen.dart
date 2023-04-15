import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/clicable_text.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/login_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 30.0,
                  // color: Colors.blue,
                  //decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              LoginTextField(
                  labelTxt: "User name",
                  prefixIcon: IconBroken.User,
                  onTxtChange: () {}),
              const SizedBox(
                height: 30,
              ),
              LoginTextField(
                  labelTxt: "Password",
                  prefixIcon: IconBroken.Password,
                  //   txtInputType: TextInputType. ,
                  onTxtChange: () {}),
              const SizedBox(
                height: 20,
              ),
              Center(child: PrimaryBtn(btnTitle: "Login", onPressed: () {})),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Do not have an acount?!",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ClicableText(txt: "sign up now", onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
