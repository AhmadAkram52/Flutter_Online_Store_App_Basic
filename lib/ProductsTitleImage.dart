import 'package:flutter/material.dart';
import 'package:online_store/Data/models/ProductsDataModel.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    super.key,
    required this.product,
  });

  final ProductsData product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.category,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            product.title,
            style: const TextStyle(color: Colors.white, fontSize: 35),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              RichText(
                text: TextSpan(children: [
                  const TextSpan(text: "Rs: ", style: TextStyle(fontSize: 20)),
                  TextSpan(
                      text: product.price.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ]),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Image.asset(
                  product.image,
                  fit: BoxFit.fill,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
