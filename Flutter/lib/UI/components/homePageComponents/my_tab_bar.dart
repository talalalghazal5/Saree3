// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/controllers/category_provider.dart';
import 'package:saree3/data/models/category.dart';

class MyTabBar extends StatefulWidget {
  final TabController tabController;
  final List<Category> categories;
  const MyTabBar(
      {super.key, required this.tabController, required this.categories});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  CategoryProvider? categoryProvider;

  List<Tab> _myTabBuilder() {
    print(widget.tabController.length);

    return List.generate(
      widget.categories.length,
      (index) => Tab(
        text: widget.categories[index].name,
      ),
    );
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
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(fontWeight: FontWeight.w400),
        labelColor: Theme.of(context).colorScheme.primary,
        labelStyle: Theme.of(context).textTheme.labelMedium,
        unselectedLabelColor: Theme.of(context).colorScheme.inverseSurface,
        dividerColor: Colors.transparent,
        controller: widget.tabController,
        indicatorColor: Theme.of(context).colorScheme.primary,
        tabs: _myTabBuilder(),
      ),
    );
  }
}
