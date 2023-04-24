import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_constants.dart';
import '../User/widgets.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  OnBoardingState createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  bool loading = false;
  late List<OnboardingModel> slides;
  final PageController _controller = PageController(initialPage: 0);
  @override
  void initState() {
    slides = [
      OnboardingModel(
          description: 'Buy and Sell Products Easily',
          image: 'assets/image/ico_1.png'),
      OnboardingModel(
          description: 'Make Bookings Easily', image: 'assets/image/ico_1.png'),
      OnboardingModel(
          description: 'Easily and Effectively Pay Bills',
          image: 'assets/image/ico_1.png'),
    ];
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      setState(() {});
    });
  }

  late Timer timer;
  @override
  void dispose() {
    _controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          Expanded(
            flex: 5,
            child: PageView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        slides[index].description,
                        style: bolo.copyWith(
                            wordSpacing: 2.5,
                            fontSize: 30,
                            fontWeight: FontWeight.w900),
                      ).paddingAll(30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Image(
                            height: 215,
                            width: 240,
                            image: AssetImage(
                              slides[index].image,
                            )),
                      ),
                    ],
                  );
                }),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              slides.length,
              (index) => buildDot(index, context),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: textButtonStyl,
              onPressed: () {},
              child: loading
                  ? const CupertinoActivityIndicator()
                  : const Text('Get Started'),
            ).paddingOnly(right: 20),
          ),
          const SizedBox(height: 35),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

// container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 15 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Get.theme.primaryColor : Colors.grey,
      ),
    );
  }
}

class OnboardingModel {
  String description;
  String image;

  OnboardingModel({
    required this.description,
    required this.image,
  });
}
