import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quantum_internship/componants/signup_tab_view.dart';
import 'package:quantum_internship/componants/text_field.dart';
import 'package:sizer/sizer.dart';

class LoginTabView extends StatelessWidget {
  LoginTabView({super.key});
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
                      Padding(
                        padding: EdgeInsets.only(right: 35, top: 13),
                        child: CustomTextField(
                          hintText: 'abc@gmail.com',
                          icon: Icons.mail,
                          controller: emailController,
                          lableText: 'Email',
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Padding(
                        padding: const EdgeInsets.only(right: 35),
                        child: CustomTextField(
                          hintText: 'Password',
                          icon: Icons.lock,
                          controller: passController,
                          lableText: 'Password',
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 200),
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 214, 1, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Login with",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      height: 7.h,
                      width: 16.w,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/icons/google.png"),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      height: 7.h,
                      width: 16.w,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/icons/meta.png"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Don't have an Account ?",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = () =>
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpTabView())),
                        text: " Register Now",
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
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 9.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            color: Color(0xffFE0000),
          ),
          child: const Center(
            child: Text("LOGIN"),
          ),
        ),
      ],
    );
  }
}
