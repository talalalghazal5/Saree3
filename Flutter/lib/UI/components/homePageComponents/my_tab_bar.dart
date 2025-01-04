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
    print(widget.tabController.length);
    if (widget.tabController.length == 0) {
      return [];
    } else {
    return List.generate(widget.tabController.length, (index) {
      return Tab(text: categoryProvider!.categories[index].name,);
    });
    }
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
        unselectedLabelStyle:  Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w400),
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
