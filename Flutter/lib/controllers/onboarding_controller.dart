import 'package:flutter/material.dart';

class OnboardingController extends ChangeNotifier {
  PageController pageController = PageController();
  int currentPage = 0;
  bool isLastPage = false;

  void nextPage() {
    if (currentPage < 3) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
      currentPage++;
    }
    if (currentPage == 3) {
      isLastPage = true;
    } else {
      isLastPage = false;
    }
    notifyListeners();
  }

  void onPageChanged(int index){
    currentPage = index;
    isLastPage = index == 3;
    notifyListeners();
  }

}
