import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/images/svgs/choose_products.svg',
                  width: 300,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Text("We've Got Everything",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: 30,
              ),
              Text.rich(
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                TextSpan(
                  text: 'Choose what you want. \n',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'You can find whatever you need ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: 'at a glance',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
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
