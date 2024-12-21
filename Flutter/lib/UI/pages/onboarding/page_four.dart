import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageFour extends StatelessWidget {
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: SvgPicture.asset(
                'assets/images/svgs/order_tracking.svg',
                width: 300,
              )),
              const SizedBox(
                height: 100,
              ),
              Text(
                "We Keep You Updated.\n",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 30,
              ),
              Text.rich(
                softWrap: true,
                textAlign: TextAlign.center,
                TextSpan(
                  text: "You won't miss the spot. \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                        text: 'We keep you ',
                        style: Theme.of(context).textTheme.bodyMedium),
                    TextSpan(
                      text: 'up to date ',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    TextSpan(
                      text: 'with your order status.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
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
