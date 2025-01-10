import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/components/homePageComponents/drawer_menu.dart';
import 'package:saree3/UI/components/homePageComponents/empty_section.dart';
import 'package:saree3/UI/components/homePageComponents/my_current_location.dart';
import 'package:saree3/UI/components/homePageComponents/my_description_box.dart';
import 'package:saree3/UI/components/homePageComponents/my_sliver_app_bar.dart';
import 'package:saree3/UI/components/homePageComponents/my_tab_bar.dart';
import 'package:saree3/UI/components/homePageComponents/product_card.dart';
import 'package:saree3/UI/pages/product_detail_page.dart';
import 'package:saree3/controllers/category_provider.dart';
import 'package:saree3/data/models/category.dart';
import 'package:saree3/data/models/product.dart';
import 'package:saree3/services/home_page_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  List<Category>? categories;
  CategoryProvider? categoryProvider;
  HomePageService homePageService = HomePageService();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 5, vsync: this);
  }

  List<Widget> _getProductsInThisCategory(List<Category> categories) {
    return categories.map(
      (category) {
        return FutureBuilder(
          future: homePageService.getProductsByCategory(category.id!),
          builder: (context, snapshot) {
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
            } else if (snapshot.data!.isEmpty) {
              return const Center(child: EmptySection());
            }
            return ListView.builder(
              addRepaintBoundaries: true,
              controller: _scrollController,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final Product product = snapshot.data![index];
                return ProductCard(
                  product: product,
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    ).toList();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  late int length;
  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: const DrawerMenu(),
      body: NestedScrollView(
        controller: _scrollController,
        floatHeaderSlivers: false,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            scaffoldKey: scaffoldKey,
            title: MyTabBar(
              tabController: _tabController,
              categories: categoryProvider!.categories,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyCurrentLocation(),
                SizedBox(height: 8),
                MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<CategoryProvider>(
          builder: (context, categories, child) {
            return TabBarView(
              controller: _tabController,
              children: _getProductsInThisCategory(categories.categories)
            );
          },
        ),
      ),
    );
  }
}
