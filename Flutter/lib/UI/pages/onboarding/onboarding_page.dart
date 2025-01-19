import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';
import 'package:saree3/UI/components/onboarding/onboarding_indices.dart';
import 'package:saree3/UI/pages/onboarding/page_four.dart';
import 'package:saree3/UI/pages/onboarding/page_one.dart';
import 'package:saree3/UI/pages/onboarding/page_three.dart';
import 'package:saree3/UI/pages/onboarding/page_two.dart';
import 'package:saree3/controllers/onboarding_controller.dart';
import 'package:saree3/main.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController controller =
        Provider.of<OnboardingController>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (value) => controller.onPageChanged(value),
              children: const [
                PageOne(),
                PageTwo(),
                PageThree(),
                PageFour(),
              ],
            ),
          ),
          const OnboardingIndices(),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: PrimaryButton(
              onPressed: () {
                if (controller.isLastPage) {
                  preferences.setBool('isSkipped', true);
                  Navigator.pushReplacementNamed(context, '/loginPage');
                }
                if (controller.currentPage < 3) {
                  controller.nextPage();
                }
              },
              text: controller.isLastPage ? 'Get Started' : 'Next',
            ),
          ),
          if (!controller.isLastPage)
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextButton(
                onPressed: () {
                  preferences.setBool('isSkipped', true);
                  print(preferences.getBool('isSkipped'));
                  Navigator.pushReplacementNamed(context, '/loginPage');
                },
                child: Text(
                  'Skip',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
