import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_store/models/ProdutsDataModel.dart';
import 'package:online_store/providers/ChangeCartValue.dart';
import 'package:provider/provider.dart';

class CartWithOrderBtn extends StatefulWidget {
  final ProductsData product;

  const CartWithOrderBtn({
    super.key,
    required this.product,
  });

  @override
  State<CartWithOrderBtn> createState() => _CartWithOrderBtnState();
}

class _CartWithOrderBtnState extends State<CartWithOrderBtn> {
  @override
  Widget build(BuildContext context) {
    final valueprovider = Provider.of<ChangeCartVal>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 50,
            ),
            Positioned(
                right: 2,
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.product.color,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(valueprovider.val.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    )))
          ],
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            Fluttertoast.showToast(
                msg: "Thank You! \n For Ordering",
                backgroundColor: widget.product.color);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Text(
              "Order Now!",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => widget.product.color),
          ),
        )
      ],
    );
  }
}
