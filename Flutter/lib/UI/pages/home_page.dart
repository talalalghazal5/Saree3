import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/UI/components/homePageComponents/drawer_menu.dart';
import 'package:saree3/UI/components/homePageComponents/homesearch_text_field.dart';
import 'package:saree3/UI/components/homePageComponents/products_list.dart';
import 'package:saree3/UI/components/homePageComponents/shoppingCartComponents/shopping_cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void _showcart(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ShoppingCart();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFF7),
      drawer: const DrawerMenu(),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFF7),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_sharp,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: HomesearchTextField(hintText: 'Search'),
        ),
        actions: [
          IconButton(
            onPressed: () => _showcart(context),
            icon: const FaIcon(
              FontAwesomeIcons.cartShopping,
              size: 25,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
              ProductsList(
                categoryName: 'Electronics',
              ), //When fetched products from the database, this will be the category name of the fetched products.
              const SizedBox(
                height: 30,
              ),
              ProductsList(
                categoryName: 'Clothes',
              ), //When fetched products from the database, this will be the category name of the fetched products.
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
