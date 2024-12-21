import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/themes/theme_provider.dart';

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
              Text(
                "We've Got Everything",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'lexend',
                    color: Theme.of(context).colorScheme.onSurface),
              ),
              const SizedBox(
                height: 30,
              ),
              Text.rich(
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                TextSpan(
                  text: 'Choose what you want. \n',
                  style: const TextStyle(fontFamily: 'lexend', fontSize: 15,),
                  children: [
                    const TextSpan(
                      text: 'You can find whatever you need ',
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
              SwitchListTile(
                inactiveThumbColor: Theme.of(context).colorScheme.onSurface,
                title: const Text('Dark mode'),
                value: Provider.of<ThemeProvider>(context).isDarkMode,
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
