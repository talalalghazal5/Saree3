import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saree3/UI/components/homePageComponents/categories_list.dart';
import 'package:saree3/UI/components/homePageComponents/drawer_menu.dart';
import 'package:saree3/UI/components/homePageComponents/products_by_categories_builder.dart';
import 'package:saree3/UI/components/homePageComponents/shoppingCartComponents/shopping_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: 80,
        shadowColor: Colors.transparent,
        title: Expanded(
          child: TextField(
            cursorColor: Theme.of(context).colorScheme.onSurface,
            decoration: InputDecoration(
              suffix: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
              filled: true,
              fillColor:
                  Theme.of(context).colorScheme.inverseSurface.withAlpha(100),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
              hintText: 'Search for products, vendors..',
              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withAlpha(200)),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        centerTitle: true,
        titleSpacing: 4,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: FaIcon(
            FontAwesomeIcons.bars,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(18),
            onPressed: () {
              scaffoldKey.currentState!
                  .showBottomSheet((context) => const ShoppingCart());
            },
            icon: FaIcon(
              FontAwesomeIcons.cartShopping,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                child: const CategoriesList(),
              ),
              const SizedBox(
                height: 20,
              ),
              ProductsByCategoriesBuilder(),
              
            ],
          ),
        ),
      ),
      drawer: const DrawerMenu(),
    );
  }
}
