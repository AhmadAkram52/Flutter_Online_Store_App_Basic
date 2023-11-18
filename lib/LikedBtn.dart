import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_store/models/ProdutsDataModel.dart';

class LikeBtn extends StatefulWidget {
  final ProductsData product;

  const LikeBtn({super.key, required this.product});

  @override
  State<StatefulWidget> createState() {
    return _LikeBtn();
  }
}

class _LikeBtn extends State<LikeBtn> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (flag)
              flag = false;
            else
              flag = true;
          });
          Fluttertoast.showToast(
              msg: flag ? "Liked" : "DisLiked",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: widget.product.color,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        child: Container(
          decoration: BoxDecoration(
              color: widget.product.color, shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: flag
                  ? FaIcon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.white,
                      size: 25,
                    )
                  : Icon(
                      Icons.heart_broken,
                      color: Colors.white,
                      size: 25,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
