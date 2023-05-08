import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quantum_internship/componants/text_field.dart';
import 'package:quantum_internship/screens/home_screen.dart';
import 'package:quantum_internship/screens/login_signup_screen.dart';
import 'package:sizer/sizer.dart';

class SignUpTabView extends StatefulWidget {
  SignUpTabView({super.key});

  @override
  State<SignUpTabView> createState() => _SignUpTabViewState();
}

class _SignUpTabViewState extends State<SignUpTabView> {
  bool checkValue = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "SignIn into your",
                        style: TextStyle(
                            color: Color.fromARGB(255, 214, 1, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Account",
                        style: TextStyle(
                            color: Color.fromARGB(255, 214, 1, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 3.h),
                      Padding(
                        padding: const EdgeInsets.only(right: 35),
                        child: CustomTextField(
                          hintText: 'Enter your name',
                          icon: Icons.person,
                          controller: nameController,
                          lableText: 'Name',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 35, top: 13),
                        child: CustomTextField(
                          hintText: 'abc@gmail.com',
                          icon: Icons.mail,
                          controller: emailController,
                          lableText: 'Email',
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 35, top: 13),
                        child: CustomTextField(
                          hintText: '7424******',
                          icon: Icons.phone,
                          lableText: 'Contact no',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 35, top: 13),
                        child: CustomTextField(
                          hintText: 'Password',
                          icon: Icons.lock,
                          controller: passController,
                          lableText: 'Password',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        visualDensity: VisualDensity.compact,
                        value: checkValue,
                        onChanged: (bool? value) {
                          setState(() {
                            checkValue = value!;
                          });
                        }),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "I agree with ",
                            style: TextStyle(
                                color: Colors.transparent,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, -2),
                                  ),
                                ], //done to make the text same as terms ans consition
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: "terms and condition",
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 214, 1, 1),
                                    offset: Offset(0, -2),
                                  )
                                ], //for giving underline which is seprate from text
                                color: Colors.transparent,
                                fontWeight: FontWeight.bold,
                                decorationColor: Color.fromARGB(255, 214, 1, 1),
                                decoration: TextDecoration.underline,
                                decorationThickness: 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    SizedBox(
                      width: 27.w,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Already have an Account ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            // recognizer: TapGestureRecognizer()
                            //   ..onTap = () =>
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen())),
                            text: " Sing In!",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 214, 1, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () async {
            if (passController.text == passController.text) {
              try {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passController.text)
                    .then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      ),
                    );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                }
                print('error' + e.code.toString());
              } catch (e) {
                print('error' + e.toString());
              }
            } else {}
          },
          child: Container(
            height: 9.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              color: Color(0xffFE0000),
            ),
            child: const Center(
              child: Text(
                "REGISTER",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
