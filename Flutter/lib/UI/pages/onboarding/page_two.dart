import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/images/svgs/safe_payment.svg',
                  width: 300,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                "Pay Safely",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 30,
              ),
              Text.rich(
                softWrap: true,
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'Rest assured. \n',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Your transactions are ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: 'secure ',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 18, color: Theme.of(context).colorScheme.primary,),
                    ),
                    TextSpan(
                      text: 'with our \n advanced payment protection',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
