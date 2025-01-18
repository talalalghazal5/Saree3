import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/themes/theme_provider.dart';
import 'package:saree3/controllers/user_controller.dart';
import 'package:saree3/services/auth_services.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key, });

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
        child: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 40,
        ),
        ListTile(
          minVerticalPadding: 50,
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/500x500.png'),
            foregroundImage: NetworkImage(Provider.of<UserController>(context).user.profilePictureUrl!),
          ),
          title: Text(
            Provider.of<UserController>(context, listen: false).user.name!,
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
            Navigator.pushNamed(context, '/orderHistory');
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
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out successfully')));
            Navigator.popAndPushNamed(context, '/loginPage');
          },
        ),
      ]),
    ));
  }
}
