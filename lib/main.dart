import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'UI/Screens/Home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          shape: Border(
            bottom: BorderSide(
              width: 0.5,
              strokeAlign: BorderSide.strokeAlignInside,
              color: Colors.grey.shade300,
            ),
          ),
          centerTitle: true,
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
