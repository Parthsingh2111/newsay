import 'package:flutter/material.dart';
import 'package:quantum_internship/componants/login_tab_view.dart';
import 'package:quantum_internship/componants/signup_tab_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 173, 177, 175),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: const Color(0xffFE0000),
        title: const Text.rich(
          TextSpan(children: [
            TextSpan(
              text: "Social",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            ),
            TextSpan(
              text: "X",
              style: TextStyle(fontSize: 37, fontWeight: FontWeight.w300),
            ),
          ]),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                color: Colors.white,
              ),
              child: const TabBar(
                labelPadding: EdgeInsets.all(20),
                indicator: BoxDecoration(
                  color: Color(0xffFE0000),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(),
                unselectedLabelStyle: TextStyle(),
                isScrollable: false,
                tabs: [
                  SizedBox(
                    child: Text("LOGIN"),
                  ),
                  SizedBox(
                    child: Text("SIGN UP"),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TabBarView(
              children: [
                LoginTabView(), //login tab view(1st tab)

                SignUpTabView(), //signup tab view(2nd tab)
              ],
            )
          ],
        ),
      ),
    );
  }
}
