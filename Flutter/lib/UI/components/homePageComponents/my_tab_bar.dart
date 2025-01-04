// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saree3/controllers/category_provider.dart';

class MyTabBar extends StatefulWidget {
  final TabController tabController;
  MyTabBar({super.key, required this.tabController});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  CategoryProvider? categoryProvider;

  List<Tab> _myTabBuilder() {
    if (categoryProvider == null || categoryProvider!.categories.isEmpty) {
      return [Tab(text: '')];
    }
    return List.generate(categoryProvider!.categories.length, (index) {
      return Tab(text: categoryProvider!.categories[index].name);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    categoryProvider = Provider.of<CategoryProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: TabBar(
        unselectedLabelStyle: TextStyle(
          color: Theme.of(context).colorScheme.inverseSurface,
        ),
        labelColor: Theme.of(context).colorScheme.primary,
        unselectedLabelColor: Theme.of(context).colorScheme.inverseSurface,
        dividerColor: Colors.transparent,
        controller: widget.tabController,
        indicatorColor: Theme.of(context).colorScheme.inversePrimary,
        tabs: _myTabBuilder(),
      ),
    );
  }
}
