import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/themes/theme_provider.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              foregroundImage: NetworkImage('https://placehold.co/500x500.png'),
            ),
            title: Text(
              'Talal Alghazal',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 20,),
          Divider(
            indent: 15,
            endIndent: 15,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
          ListTile(trailing: IconButton(onPressed: (){
            themeProvider.toggleTheme();
          }, icon: FaIcon(
            themeProvider.isDarkMode ? FontAwesomeIcons.solidMoon : FontAwesomeIcons.solidSun
          ))),
          ListTile(
            title: const Text('about'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
