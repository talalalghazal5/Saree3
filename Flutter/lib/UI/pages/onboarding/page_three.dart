import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

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
                'assets/images/svgs/fast_delivery.svg',
                width: 300,
              )),
              const SizedBox(
                height: 100,
              ),
              const Text(
                "It's Never Too Late\n",
                style: TextStyle(fontSize: 25, fontFamily: 'lexend'),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text.rich(
                softWrap: true,
                textAlign: TextAlign.center,
                TextSpan(
                  text: "You don't have to wait. \n",
                  style: TextStyle(fontFamily: 'lexend', fontSize: 15),
                  children: [
                    TextSpan(
                      text: 'Your orders will be delivered to you ',
                    ),
                    TextSpan(
                      text: 'in a blink of an eye.',
                      style: TextStyle(
                        color: Color(0xffFF7F50),
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
