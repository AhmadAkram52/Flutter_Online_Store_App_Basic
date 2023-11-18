import 'package:flutter/material.dart';
import 'package:online_store/ProductsCategoriesBar.dart';
import 'package:online_store/ProductsGridView.dart';

class AppBody extends StatefulWidget {
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 30),
        GroceryCategories(),
        SizedBox(height: 5),
        ProductsView(),
      ],
    );
  }
}
