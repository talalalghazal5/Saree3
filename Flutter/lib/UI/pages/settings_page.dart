import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/themes/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? location = 'As Suwayda';
  String? selectedLanguage = 'en';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                foregroundImage:
                    const NetworkImage('https://placehold.co/500x500.png'),
                radius: 70,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Talal Alghazal',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/infoEditingPage');
                },
                color: themeProvider.isDarkMode
                    ? Theme.of(context).colorScheme.onSurface.withAlpha(100)
                    : Theme.of(context).colorScheme.primary.withAlpha(50),
                highlightElevation: 0,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Edit profile',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: themeProvider.isDarkMode
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).colorScheme.primary,
                        letterSpacing: -0.2,
                      ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Personal Info',
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .inverseSurface
                      .withAlpha(80),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Phone Number:',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(200),
                          ),
                    ),
                    Text(
                      '0935299727',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            color: Theme.of(context)
                                .colorScheme
                                .inverseSurface
                                .withAlpha(255),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .inverseSurface
                      .withAlpha(80),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Adress:',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(200),
                          ),
                    ),
                    Text(
                      location!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            color: Theme.of(context)
                                .colorScheme
                                .inverseSurface
                                .withAlpha(255),
                          ),
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Preferences',
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: SwitchListTile(
                  title: Text(
                    'Dark mode',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(200),
                        ),
                  ),
                  value: themeProvider.isDarkMode,
                  onChanged: (value) => setState(() {
                    themeProvider.toggleTheme();
                  }),
                  tileColor: Theme.of(context)
                      .colorScheme
                      .inverseSurface
                      .withAlpha(40),
                  trackColor: WidgetStatePropertyAll(
                    themeProvider.isDarkMode
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .colorScheme
                            .surfaceContainer
                            .withAlpha(130),
                  ),
                  trackOutlineColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                  thumbColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.onSurface.withAlpha(210)),
                  thumbIcon: const WidgetStatePropertyAll(
                    Icon(
                      FontAwesomeIcons.circle,
                      color: Colors.transparent,
                      size: 50,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .inverseSurface
                        .withAlpha(40),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Language',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(200),
                          ),
                    ),
                    DropdownButton<String>(
                      value: selectedLanguage,
                      style: Theme.of(context).textTheme.bodyMedium,
                      underline: Container(
                        height: 0,
                      ),
                      isDense: true,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      items: [
                        DropdownMenuItem(
                          value: 'en',
                          child: Text(
                            'English',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'ar',
                          child: Text(
                            'Arabic',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value!;
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
