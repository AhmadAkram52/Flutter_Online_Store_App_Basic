import 'package:flutter/material.dart';
import 'package:online_store/DetailsScreen.dart';
import 'package:online_store/models/ProdutsDataModel.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<ProductsData> searchlist = allProducts;

  @override
  void initState() {
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
        title: Text("Search Products"),
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
              padding: EdgeInsets.all(10),
              itemCount: searchlist.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  // tileColor: searchlist[index].color,
                  leading: Image.asset(searchlist[index].image),
                  title: Text(searchlist[index].title),
                  subtitle: Text(searchlist[index].category),
                  trailing: Icon(Icons.shopping_cart),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                              product: searchlist[index],
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

  void pushDataToList(List<dynamic> List, List<List<dynamic>> Lists) {
    for (var sourceList in Lists) {
      List.addAll(sourceList);
    }
  }

  void _searchProducts(String query) {
    setState(() {
      searchlist = allProducts
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
