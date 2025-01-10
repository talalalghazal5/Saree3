import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/themes/theme_provider.dart';
import 'package:saree3/main.dart';
import 'package:saree3/services/auth_services.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            ListTile(minVerticalPadding: 50,
              leading: const CircleAvatar(
                radius: 30,
                foregroundImage:
                    NetworkImage('https://placehold.co/500x500.png'),
              ),
              title: Text(
                'Talal Alghazal',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              onTap: () => Navigator.pushNamed(context, '/settingsPage'),
            ),
            Divider(
              indent: 15,
              endIndent: 15,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
          
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.solidHeart,
                color: Theme.of(context).colorScheme.onSurface,
                size: 20,
              ),
              title: Text(
                'Favorites',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.clockRotateLeft,
                color: Theme.of(context).colorScheme.onSurface,
                size: 20,
              ),
              title: Text(
                'Order History',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.doorOpen,
                color: Theme.of(context).colorScheme.error.withAlpha(200),
                size: 20,
              ),
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.error.withAlpha(200)),
              ),
              onTap: () async {
                await AuthServices().logout();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logged out successfully')));
                Navigator.popAndPushNamed(context, '/loginPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
