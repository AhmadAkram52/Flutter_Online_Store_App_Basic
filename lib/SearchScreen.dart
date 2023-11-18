import 'package:flutter/material.dart';
import 'package:online_store/Data/models/ProductsDataModel.dart';
import 'package:online_store/DetailsScreen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ProductsData> searchList = allProducts;

  @override
  void initState() {
    super.initState();
    pushDataToList(allProducts, listsToPush);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     // Handle back button pressed
        //   },
        // ),
        title: const Text("Search Products"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              onChanged: _searchProducts,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search Name of Products',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: searchList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  // tileColor: searchList[index].color,
                  leading: Image.asset(searchList[index].image),
                  title: Text(searchList[index].title),
                  subtitle: Text(searchList[index].category),
                  trailing: const Icon(Icons.shopping_cart),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                              product: searchList[index],
                            )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void pushDataToList(List<dynamic> list, List<List<dynamic>> lists) {
    for (var sourceList in lists) {
      list.addAll(sourceList);
    }
  }

  void _searchProducts(String query) {
    setState(() {
      searchList = allProducts
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
