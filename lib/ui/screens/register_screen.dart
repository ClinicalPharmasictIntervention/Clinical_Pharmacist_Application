import 'package:clinical_pharmacist_intervention/business_logic/sign_up_cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/business_logic/sign_up_cubit/states.dart';
import 'package:clinical_pharmacist_intervention/shared/cubit/cubit.dart';
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/clicable_text.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/default_textfield.dart';
import 'package:clinical_pharmacist_intervention/ui/elements/primary_btn.dart';
import 'package:clinical_pharmacist_intervention/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regexpattern/regexpattern.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var idController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var hospitalID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SignUpCubit.get(context);
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
                child: Form(
                  key: formKey,
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
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'User name is empty';
                          } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Enter correct user name';
                          } else {
                            return null;
                          }
                        },
                        controller: userNameController,
                        labelTxt: "User name",
                        hintTxt: "Please, enter at least 4 names.",
                        prefixIcon: IconBroken.User,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultTextField(
                        controller: idController,
                        labelTxt: "ID",
                        hintTxt: "Your ID in this Hospital.",
                        prefixIcon: IconBroken.Unlock,
                        txtInputType: TextInputType.phone,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'ID number is empty';
                          } else if (!idController.text.isNumeric()) {
                            return 'Enter correct ID';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultTextField(
                        controller: hospitalID,
                        labelTxt: "Hospital ID",
                        hintTxt: "Your Hospital.",
                        prefixIcon: IconBroken.Heart,
                        txtInputType: TextInputType.phone,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Hospital ID is empty';
                          } else if (!idController.text.isNumeric()) {
                            return 'Enter correct hospital ID';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultTextField(
                        controller: emailController,
                        labelTxt: "E-Mail",
                        hintTxt: "Ex:pharmacist17ahmed@cpi.com",
                        prefixIcon: IconBroken.Message,
                        txtInputType: TextInputType.emailAddress,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Email is empty';
                          } else if (!emailController.text.isEmail()) {
                            return 'Enter correct email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultTextField(
                        controller: phoneController,
                        labelTxt: "Phone Number",
                        hintTxt: "Your current phone number",
                        prefixIcon: IconBroken.Call,
                        txtInputType: TextInputType.phone,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Phone Number is empty';
                          } else if (!phoneController.text.isPhone()) {
                            return 'Enter correct phone number';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultTextField(
                        isPassword: true,
                        controller: passwordController,
                        labelTxt: "Password",
                        hintTxt: "Strong Password",
                        prefixIcon: IconBroken.Password,
                        txtInputType: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Password is empty';
                          } else if (value.length < 8) {
                            return 'Enter at least eight characters';
                          } else if (!passwordController.text
                              .isPasswordNormal3Withspace()) {
                            return 'Enter at least one upper case and one number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultTextField(
                        isPassword: true,
                        controller: confirmPasswordController,
                        labelTxt: "Confirm Password",
                        hintTxt: "Typical Password",
                        prefixIcon: IconBroken.Password,
                        txtInputType: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Password is empty';
                          } else if (passwordController.text !=
                              confirmPasswordController.text) {
                            return 'Password is not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: PrimaryBtn(
                            btnTitle: "Register",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userSignUp(
                                  userName: userNameController.text,
                                  id: idController.text,
                                  hospitalID: hospitalID.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                );
                                navigateTo(context, SignInScreen());
                              } else {
                                cubit.validateFields();
                              }
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
                              txt: "Sign in now",
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
          ),
        );
      },
    );
  }
}
