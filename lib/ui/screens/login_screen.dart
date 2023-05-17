import 'package:clinical_pharmacist_intervention/business_logic/sign_in_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/sign_in_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/shared/utilities.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/clicable_text.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SignInCubit.get(context);
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            appBar: AppBar(),
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsetsDirectional.all(12.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                          height: 300.0,
                          width: 300.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 30.0,
                            // color: Colors.blue,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      DefaultTextField(
                        controller: emailController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'User name is empty';
                          } else {
                            return null;
                          }
                        },
                        hintTxt: '',
                        labelTxt: "Email",
                        prefixIcon: IconBroken.Message,
                        txtInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DefaultTextField(
                        controller: passwordController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Password is empty';
                          } else {
                            return null;
                          }
                        },
                        isPassword: true,
                        hintTxt: '',
                        labelTxt: "Password",
                        prefixIcon: IconBroken.Password,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: PrimaryBtn(
                          btnTitle: "SignIn",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userSignIn(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              navigateTo(context, LayoutScreen());
                            } else {
                              cubit.validateFields();
                            }
                          },
                        ),
                      ),
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
            ),
          ),
        );
      },
    );
  }
}
