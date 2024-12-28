import 'package:flutter/material.dart';
import 'package:saree3/ui/components/custom_text_field.dart';
import 'package:saree3/ui/components/homePageComponents/drawer_menu.dart';
import 'package:saree3/ui/components/homePageComponents/products_list.dart';
import 'package:saree3/ui/components/homePageComponents/shoppingCartComponents/shopping_cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void _showcart(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ShoppingCart();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFF7),
      drawer: DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFF7),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.menu_sharp,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        title: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomTextField(hintText: 'Search')),
        actions: [
          IconButton(
              onPressed: () => _showcart(context),
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              )),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Categories',
                //       style: TextStyle(
                //           fontFamily: 'Lexend',
                //           fontWeight: FontWeight.bold,
                //           fontSize: 20),
                //     ),
                //   ],
                // ),
                // Container(
                //   height: 250,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     clipBehavior: Clip.none,
                //     itemBuilder: (context, index) {
                //       return Icon(Icons.phone_android);
                //     },
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Elctronics',
                      style: TextStyle(
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text('show more',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xff240CAA))))
                  ],
                ),
                ProdectsList(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Clothes',
                      style: TextStyle(
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text('show more',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xff240CAA))))
                  ],
                ),
                ProdectsList()
              ],
            ),
          )),
      resizeToAvoidBottomInset: true,
    );
  }
}
