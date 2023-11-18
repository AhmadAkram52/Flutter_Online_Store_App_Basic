import 'package:flutter/material.dart';
import 'package:online_store/Data/models/ProductsDataModel.dart';
import 'package:online_store/DetailViewBody.dart';
import 'package:online_store/SearchScreen.dart';

class DetailsScreen extends StatelessWidget {
  final ProductsData product;

  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: DetailViewBody(
        product: product,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context, // Use the valid BuildContext here
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            )),
        // IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.shopping_cart,
        //       color: Colors.white,
        //     ))
      ],
    );
  }
}
