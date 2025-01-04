import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/components/homePageComponents/drawer_menu.dart';
import 'package:saree3/UI/components/homePageComponents/my_current_location.dart';
import 'package:saree3/UI/components/homePageComponents/my_sliver_app_bar.dart';
import 'package:saree3/UI/components/homePageComponents/my_tab_bar.dart';
import 'package:saree3/UI/components/homePageComponents/product_card.dart';
import 'package:saree3/controllers/category_provider.dart';
import 'package:saree3/data/models/category.dart';
import 'package:saree3/data/models/product.dart';
import 'package:saree3/services/home_page_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  late final CategoryProvider categoryProvider;
  HomePageService homePageService = HomePageService();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    categoryProvider = Provider.of<CategoryProvider>(context);
    int tabLength = categoryProvider.categories.isEmpty
        ? 1
        : categoryProvider.categories.length;
    _tabController = TabController(
      length: tabLength,
      vsync: this,
    );
  }

  List<Widget> _getFoodInThisCategory(List<Category> categories) {
    if (categories.isEmpty) {
      return [Center(
        
      )];
    }
    return categories.map((category) {
      return FutureBuilder(
        future: homePageService.getProductsByCategory(category.id!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (snapshot.error is SocketException) {
              return Text(
                'Connection failed, please try again later or check you internet connection',
                style: Theme.of(context).textTheme.bodySmall,
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (!snapshot.hasData) {
            return Center(
              child: Text(
                '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }
          return ListView.builder(
            controller: _scrollController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final Product product = snapshot.data![index];
              return ProductCard(product: product);
            },
          );
        },
      );
    }).toList();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      drawer: const DrawerMenu(),
      body: NestedScrollView(
        controller: _scrollController,
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            scaffoldKey: scaffoldKey,
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyCurrentLocation(),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
        body: Consumer<CategoryProvider>(
          builder: (context, provider, child) => TabBarView(
            controller: _tabController,
            children: _getFoodInThisCategory(provider.categories),
          ),
        ),
      ),
    );
  }
}
