import 'package:flutter/material.dart';
import 'package:online_store/CartCounter.dart';
import 'package:online_store/CartWithOrderBtn.dart';
import 'package:online_store/LikedBtn.dart';
import 'package:online_store/ProductTitleImage.dart';
import 'package:online_store/models/ProdutsDataModel.dart';

class DetailViewBody extends StatelessWidget {
  final ProductsData product;

  const DetailViewBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12, right: 20, left: 20),
                  height: 500,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.description,
                        style: const TextStyle(height: 1.5),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CartCounter(),
                          LikeBtn(
                            product: product,
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      CartWithOrderBtn(product: product),
                    ],
                  ),
                ),
                ProductTitlewithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
