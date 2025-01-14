import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/components/homePageComponents/empty_section.dart';
import 'package:saree3/UI/themes/theme_provider.dart';
import 'package:saree3/data/models/user.dart';
import 'package:saree3/services/profile_services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? location = 'As Suwayda';
  String? selectedLanguage = 'en';
  ProfileServices profileServices=ProfileServices();
  List<User>?user=[];
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
        child: FutureBuilder(
          future: profileServices.profile(),
          builder: (BuildContext context,  snapshot) { 
            if (snapshot.hasError) {
              if (snapshot.error is SocketException ||
                  snapshot.error is ClientException) {
                return Text(
                  'Connection failed, please try again later or check you internet connection',
                  style: Theme.of(context).textTheme.bodySmall,
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data == null) {
              return const Center(child: Text('no data'));
            }
          return Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                  foregroundImage:
                       NetworkImage('${snapshot.data?.profilePictureUrl}'),
                  radius: 70,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  snapshot.data!.name!,
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
                        .withAlpha(40),
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
                        snapshot.data!.phone_number!,
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
                        .withAlpha(40),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Address:',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(200),
                            ),
                      ),
                      const SizedBox(width: 20,),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                         snapshot.data!.location!,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            overflow: TextOverflow.ellipsis,
                                fontSize: 14,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface
                                    .withAlpha(255),
                              ),
                          overflow: TextOverflow.fade,
                        ),
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
          );
                     },

        ),
      ),
    );
  }
}
