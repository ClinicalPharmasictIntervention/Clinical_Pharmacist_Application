import 'package:clinical_pharmacist_intervention/ui/screens/register_screen.dart';
import 'package:clinical_pharmacist_intervention/ui/themes/constants.dart';
import 'package:flutter/material.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

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
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Column(
            children: [
              //start page
              const SizedBox(
                height: 140,
              ),
              const Text(
                "Type of Account",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: Lora),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Choose the type of your account, the careful to change it is impossible.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              //choose type
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // doctor
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 200,
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(bottom: 12.0),
                            child: Text(
                              "I am a doctor",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          subtitle: Text(
                            "The easiest way to communicate between the physician and the clinical pharmacist.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            maxLines: 4,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 130,
                          child: Image.asset("assets/images/avatar_doctor.png"))
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  // clnical pharmacist

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 200,
                          child: ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                "I am a clinical pharmacist",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            subtitle: Text(
                              "The easiest way to write your recommendation to a doctor.",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              maxLines: 4,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 130,
                            child: Image.asset(
                                "assets/images/avatar_clinical_pharmacist2.png"))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
              /*
              ListTile(
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    "I am a doctor",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                subtitle: const Text(
                  "The easiest way to communicate between the physician and the clinical pharmacist.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                ),
                trailing: Image.asset("assets/images/avatar_doctor.png"),
              ),
    
              */
            ],
          )),
        ),
      ),
    );
  }
}
