import 'package:flutter/material.dart';
import 'package:online_store/models/ProdutsDataModel.dart';

class ProductTitlewithImage extends StatelessWidget {
  const ProductTitlewithImage({
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
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            product.title,
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: "Rs: ", style: TextStyle(fontSize: 20)),
                  TextSpan(
                      text: product.price.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ]),
              ),
              SizedBox(width: 20),
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
