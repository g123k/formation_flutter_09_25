import 'package:flutter/foundation.dart';
import 'package:untitled1/model/product.dart';

class ProductNotifier extends ChangeNotifier {
  ProductNotifier() {
    loadProduct();
  }

  Product? product;

  Future<void> loadProduct() async {
    await Future.delayed(Duration(seconds: 5));
    product = generateProduct();
    notifyListeners();
  }
}
