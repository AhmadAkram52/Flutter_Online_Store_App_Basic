import 'package:flutter/material.dart';
import 'package:online_store/DetailsScreen.dart';
import 'package:online_store/ProductsCardView.dart';
import 'package:online_store/providers/ChangeCategoryProvider.dart';
import 'package:provider/provider.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChangeCategory>(context);
    return Consumer(builder: (context, value, child) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
              itemCount: provider.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.75),
              itemBuilder: (context, index) {
                return ProductCard(
                    product: provider.products[index],
                    press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    product: provider.products[index],
                                  )),
                        ));
              }),
        ),
      );
    });
  }
}
