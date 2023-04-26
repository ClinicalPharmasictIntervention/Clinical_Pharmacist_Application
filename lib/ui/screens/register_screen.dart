import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/clicable_text.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  "Register",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 20.0,
                    // color: Colors.blue,
                    //decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                DefaultTextField(
                    labelTxt: "User name",
                    hintTxt: "Please, enter at least 4 names.",
                    prefixIcon: IconBroken.User,
                    onTxtChange: () {}),
                const SizedBox(
                  height: 20,
                ),
                DefaultTextField(
                    labelTxt: "ID",
                    hintTxt: "Your ID in this Hospital.",
                    prefixIcon: IconBroken.Unlock,
                    onTxtChange: () {}),
                const SizedBox(
                  height: 20,
                ),
                DefaultTextField(
                    labelTxt: "E-Mail",
                    hintTxt: "ex: doctor17ahmed@cpi.com 😂🤭",
                    prefixIcon: IconBroken.Message,
                    txtInputType: TextInputType.emailAddress,
                    onTxtChange: () {}),
                const SizedBox(
                  height: 20,
                ),
                DefaultTextField(
                    labelTxt: "Phone Number",
                    hintTxt: "your current phone number",
                    prefixIcon: IconBroken.Call,
                    txtInputType: TextInputType.phone,
                    onTxtChange: () {}),
                const SizedBox(
                  height: 20,
                ),
                DefaultTextField(
                    labelTxt: "Password",
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
                      btnTitle: "Register",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have you an acount?",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ClicableText(
                        txt: "sign in now",
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => LoginScreen()),
                          // );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
