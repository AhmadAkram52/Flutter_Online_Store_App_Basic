import 'package:flutter/foundation.dart';

import '../Data/models/ProductsDataModel.dart';

class ChangeCategory with ChangeNotifier {
  List<ProductsData> products = fruitProducts;

  List<ProductsData> get productslist => products;

  void setlist(int index) {
    switch (index) {
      case 0:
        products = fruitProducts;
        notifyListeners();
        break;
      case 1:
        products = vegetableProducts;
        notifyListeners();
        break;
      case 2:
        products = meatProducts;
        notifyListeners();
        break;
      case 3:
        products = snacksProducts;
        notifyListeners();
        break;
      case 4:
        products = bakeryProducts;
        notifyListeners();
        break;
      case 5:
        products = canProducts;
        notifyListeners();
        break;
      case 6:
        products = drinkProducts;
        notifyListeners();
        break;
    }
  }
}
