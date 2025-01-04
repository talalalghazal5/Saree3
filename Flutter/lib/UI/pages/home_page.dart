import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  CategoryProvider? categoryProvider;
  HomePageService homePageService = HomePageService();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void _fetchCategories() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      categoryProvider!.fetchCategories();
    });
    setState(() {
      _tabController = TabController(
        length: categoryProvider!.categories.isEmpty
            ? 1
            : categoryProvider!.categories.length,
        vsync: this,
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    categoryProvider = Provider.of<CategoryProvider>(context, listen: true);
    _fetchCategories();
    // setState(() {
    //   _tabController = TabController(
    //   length: categoryProvider!.categories.isEmpty
    //     ? 1
    //     : categoryProvider!.categories.length,
    //   vsync: this,
    // );
    // });
  }

  List<Widget> _getProductsInThisCategory(List<Category> categories) {
    return categories.map(
      (category) {
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
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data!.isEmpty) {
              return const Center(child: EmptySection());
            }
            return ListView.builder(
              controller: _scrollController,
              physics: const NeverScrollableScrollPhysics(),
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
  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      drawer: const DrawerMenu(),
      body: FutureBuilder(
        future: Provider.of<CategoryProvider>(context, listen: false)
            .fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return NestedScrollView(
            controller: _scrollController,
            floatHeaderSlivers: false,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              MySliverAppBar(
                scaffoldKey: scaffoldKey,
                title: categoryProvider!.categories.isNotEmpty
                    ? MyTabBar(tabController: _tabController)
                    : Container(),
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
            body: categoryProvider!.categories.isEmpty
                ? const Center(child: EmptySection())
                : TabBarView(
                    controller: _tabController,
                    children: _getProductsInThisCategory(
                        categoryProvider!.categories),
                  ),
          );
        },
      ),
    );
  }
}
