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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: SvgPicture.asset(
                'assets/images/svgs/safe_payment.svg',
                width: 300,
              )),
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Pay Safely",
                style: TextStyle(fontSize: 25, fontFamily: 'lexend'),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text.rich(
                softWrap: true,
                textAlign: TextAlign.center,
                TextSpan(
                    text: 'Rest assured \n',
                    style: TextStyle(fontFamily: 'lexend', fontSize: 15),
                    children: [
                      TextSpan(
                        text: 'Your transactions are ',
                      ),
                      TextSpan(
                        text: 'secure ',
                        style: TextStyle(
                          color: Color(0xffFF7F50),
                        ),
                      ),
                      TextSpan(text: 'with our \n advanced payment protection')
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
