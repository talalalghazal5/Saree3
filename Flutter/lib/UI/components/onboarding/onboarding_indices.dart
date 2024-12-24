import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/controllers/onboarding_controller.dart';

class OnboardingIndices extends StatelessWidget {
  const OnboardingIndices({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController controller = Provider.of<OnboardingController>(context);
    Color activeColor = Theme.of(context).colorScheme.secondary;
    Color inactiveColor = Theme.of(context).colorScheme.inverseSurface;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          4,
          (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 6,
              width: controller.currentPage == index ? 20 : 6,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: controller.currentPage == index ? activeColor : inactiveColor,
              ),
            );
          },
        ),
      ],
    );
  }
}
