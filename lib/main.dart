import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quantum_internship/provider/provider_function.dart';
import 'package:quantum_internship/screens/home_screen.dart';
import 'package:quantum_internship/screens/login_signup_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';

void main() async {
//step1.intitaliz hive
  await Hive.initFlutter();
// step2.open the box
  await Hive.openBox('titlebox');
  await Hive.openBox('source');
  await Hive.openBox('desc');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Movementfun(),
      child: Sizer(
        builder: (context, orientation, deviceType) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        ),
      ),
    );
  }
}
