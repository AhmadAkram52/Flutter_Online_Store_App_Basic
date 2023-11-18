import 'package:flutter/material.dart';
import 'package:online_store/providers/ChangeCartValue.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CartConter();
  }
}

class _CartConter extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    final valueProvider = Provider.of<ChangeCartVal>(context);
    return Row(
      children: [
        buildButton(
            const Icon(
              Icons.remove,
              color: Colors.black,
            ), press: () {
          if (numOfItems > 1) {
            setState(() {
              numOfItems--;
              valueProvider.setVal(numOfItems);
            });
          }
        }),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "$numOfItems",
            style: const TextStyle(fontSize: 20),
          ),
        ),
        buildButton(
            const Icon(
              Icons.add,
              color: Colors.black,
            ), press: () {
          setState(() {
            numOfItems++;
            valueProvider.setVal(numOfItems);
          });
        })
      ],
    );
  }

  SizedBox buildButton(Icon icon, {required Function() press}) {
    return SizedBox(
      height: 34,
      width: 40,
      child: OutlinedButton(
          onPressed: press,
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: icon),
    );
  }
}
