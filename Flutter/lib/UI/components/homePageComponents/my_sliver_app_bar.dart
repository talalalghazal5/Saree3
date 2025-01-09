import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/UI/components/homePageComponents/app_bar_text_field.dart';
import 'package:saree3/UI/components/homePageComponents/shoppingCartComponents/shopping_cart.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MySliverAppBar(
      {super.key,
      required this.child,
      required this.title,
      required this.scaffoldKey});

//=======================================----------M A I N  C O N T E N T ------------=======================================================

  @override
  Widget build(context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Theme.of(context).colorScheme.inverseSurface,
      foregroundColor: Theme.of(context).colorScheme.inverseSurface,
      title: const AppBarTextField(),
      centerTitle: true,
      expandedHeight: 350,
      collapsedHeight: 150,
      floating: false,
      pinned: true,
      leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: FaIcon(
            FontAwesomeIcons.bars,
            color: Theme.of(context).colorScheme.onSurface,
          )),
      actions: [
        IconButton(
          onPressed: () {
            scaffoldKey.currentState!.showBottomSheet(
              (context) => const ShoppingCart(),
              showDragHandle: true,
              enableDrag: true,
              sheetAnimationStyle: AnimationStyle(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 300),
              ),
            );
          },
          icon: FaIcon(
            FontAwesomeIcons.cartShopping,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Theme.of(context).colorScheme.inverseSurface.withAlpha(10),
          padding: const EdgeInsets.only(bottom: 60),
          child: child,
        ),
        title: title,
        titlePadding: const EdgeInsets.only(bottom: 0),
        centerTitle: true,
        expandedTitleScale: 1,
      ),
    );
  }
}
