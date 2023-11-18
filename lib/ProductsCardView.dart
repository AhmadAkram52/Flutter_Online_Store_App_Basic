import 'package:flutter/material.dart';
import 'package:online_store/Data/models/ProductsDataModel.dart';

class ProductCard extends StatelessWidget {
  final ProductsData product;
  final void Function() press;

  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Image.asset(product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              product.title,
              style: const TextStyle(color: Colors.black38, fontSize: 20),
            ),
          ),
          Text("Rs: ${product.price}"),
        ],
      ),
    );
  }
}
