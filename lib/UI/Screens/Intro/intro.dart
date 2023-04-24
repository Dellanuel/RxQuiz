import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharm_quiz/UI/Screens/Features/discover_page.dart';
import 'package:pharm_quiz/UI/Screens/Home/home.dart';

// class Intro extends StatefulWidget {
//   const Intro({super.key});

//   @override
//   State<Intro> createState() => _IntroState();
// }

// class _IntroState extends State<Intro> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: AlertDialog(
//         elevation: 5,
//         insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         contentPadding: EdgeInsets.zero,
//         content: SignInScreen(
//           providers: [EmailAuthProvider()],
//           actions: [
//             AuthStateChangeAction<SignedIn>((context, state) {
//               Get.to(() => const Discover());
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [],
      ),
    );
  }
}
