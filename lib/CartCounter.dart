import 'package:flutter/material.dart';
import 'package:online_store/providers/ChangeCartValue.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartConter();
  }
}

class _CartConter extends State<CartCounter> {
  int numofitems = 1;

  @override
  Widget build(BuildContext context) {
    final valueprovider = Provider.of<ChangeCartVal>(context);
    return Row(
      children: [
        buildbuton(
            Icon(
              Icons.remove,
              color: Colors.black,
            ), press: () {
          if (numofitems > 1)
            setState(() {
              numofitems--;
              valueprovider.setval(numofitems);
            });
        }),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "$numofitems",
            style: TextStyle(fontSize: 20),
          ),
        ),
        buildbuton(
            Icon(
              Icons.add,
              color: Colors.black,
            ), press: () {
          setState(() {
            numofitems++;
            valueprovider.setval(numofitems);
          });
        })
      ],
    );
  }

  SizedBox buildbuton(Icon icon, {required Function() press}) {
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
