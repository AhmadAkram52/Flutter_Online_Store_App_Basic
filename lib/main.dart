import 'package:flutter/material.dart';
import 'package:online_store/HomePage.dart';
import 'package:online_store/SearchScreen.dart';
import 'package:online_store/SplashScreen.dart';
import 'package:online_store/providers/ChangeCartValue.dart';
import 'package:online_store/providers/ChangeCategoryProvider.dart';
import 'package:provider/provider.dart';

import 'Data/models/ProductsDataModel.dart';

void main() {
  runApp(const OnlineStoreApp());
}

class OnlineStoreApp extends StatelessWidget {
  const OnlineStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsData productsData;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ChangeCategory>(
              create: (_) => ChangeCategory()),
          ChangeNotifierProvider<ChangeCartVal>(create: (_) => ChangeCartVal())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.pink),
          home: SplashScreen(),
          // home: SearchScreen(),
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: AppBody(),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: Colors.pink,
      elevation: 0,
      title: const Text("Grocery Store",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Times')),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context, // Use the valid BuildContext here
              MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
      ],
    );
  }
}
