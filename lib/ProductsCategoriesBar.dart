import 'package:flutter/material.dart';
import 'package:online_store/providers/ChangeCategoryProvider.dart';
import 'package:provider/provider.dart';

class GroceryCategories extends StatefulWidget {
  const GroceryCategories({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GroceryCategories();
  }
}

class _GroceryCategories extends State<GroceryCategories> {
  List<String> categorieslist = [
    "Fruits",
    "Vegetables",
    "Meat",
    "Snacks",
    "Bakery",
    "Cans Jars",
    "Drinks",
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .07,
      child: RawScrollbar(
        thumbColor: Colors.red,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.013),
          itemCount: categorieslist.length,
          itemBuilder: (context, index) {
            return buildCategory(index);
          },
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    final provider = Provider.of<ChangeCategory>(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
          provider.setlist(index);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          decoration: BoxDecoration(
              color: selected == index ? Colors.pink : Colors.transparent,
              // shape: BoxShape.circle,
              border: Border.all(color: Colors.pink),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              categorieslist[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: selected == index ? Colors.white : Colors.black),
            ),
          ),
        ),
        // Selected Category
      ),
    );
  }
}
