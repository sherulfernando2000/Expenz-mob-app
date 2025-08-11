import 'package:flutter/material.dart';
import 'package:flutter2/constants/colors.dart';
import 'package:flutter2/data/onboarding_data.dart';
import 'package:flutter2/screens/onboarding/front_page.dart';
import 'package:flutter2/screens/onboarding/shared_onboarding_screen.dart';
import 'package:flutter2/screens/user_data_screen.dart';
import 'package:flutter2/widgets/custom_button.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //page controller
  final _controller = PageController();
  bool showDetailsPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Page content
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() {
                        showDetailsPage = index == 3;
                        print(showDetailsPage);
                      });
                    },
                    children: [
                      const FrontPage(),
                      SharedOnboardingScreen(
                        title: OnBoardingData.onboardingDataList[0].title,
                        imagePath:
                            OnBoardingData.onboardingDataList[0].imagePath,
                        description:
                            OnBoardingData.onboardingDataList[0].description,
                      ),
                      SharedOnboardingScreen(
                        title: OnBoardingData.onboardingDataList[1].title,
                        imagePath:
                            OnBoardingData.onboardingDataList[1].imagePath,
                        description:
                            OnBoardingData.onboardingDataList[1].description,
                      ),
                      SharedOnboardingScreen(
                        title: OnBoardingData.onboardingDataList[2].title,
                        imagePath:
                            OnBoardingData.onboardingDataList[2].imagePath,
                        description:
                            OnBoardingData.onboardingDataList[2].description,
                      ),
                    ],
                  ),
                  //Page indicator
                  Align(
                    alignment: const Alignment(0, 0.65),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      effect: const WormEffect(
                        activeDotColor: kMainColor,
                        dotColor: kLightGrey,
                      ),
                    ),
                  ),

                  // Navigation button outside Expanded
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: !showDetailsPage
                          ? GestureDetector(
                              onTap: () {
                                _controller.animateToPage(
                                  _controller.page!.toInt() + 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: CustumButton(
                                buttonName: showDetailsPage
                                    ? "Get Started"
                                    : "Next",
                                buttonColor: kMainColor,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UserDataScreen(),
                                  ),
                                );
                              },
                              child: CustumButton(
                                buttonName: showDetailsPage
                                    ? "Get Started"
                                    : "Next",
                                buttonColor: kMainColor,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
