import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharm_quiz/UI/Screens/Intro/intro.dart';
import 'UI/Screens/Home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        tooltipTheme:
            const TooltipThemeData(triggerMode: TooltipTriggerMode.tap),
        iconTheme: const IconThemeData(size: 23),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconSize: const MaterialStatePropertyAll(22),
            shape: MaterialStateProperty.all(const CircleBorder()),
          ),
        ),
        appBarTheme: AppBarTheme(
          shape: Border(
            bottom: BorderSide(
              width: 0.5,
              strokeAlign: BorderSide.strokeAlignInside,
              color: Colors.grey.shade300,
            ),
          ),
          titleSpacing: 5,
          centerTitle: false,
          toolbarHeight: 60,
          elevation: 0,
          color: Colors.white,
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 600),
    );
  }
}
