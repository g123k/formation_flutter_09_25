import 'package:flutter/foundation.dart';
import 'package:untitled1/api/model/product_response.dart';
import 'package:untitled1/api/openfoodfacts_api.dart';
import 'package:untitled1/model/product.dart';

class ProductNotifier extends ChangeNotifier {
  ProductNotifier() {
    loadProduct();
  }

  Product? product;

  Future<void> loadProduct() async {
    try {
      ProductAPIEntity resp = await OpenFoodFactsAPIManager().loadProduct(
        '5000159484695',
      );
      product = resp.response?.toProduct();
    } catch (_) {
      // TODO
    }
    notifyListeners();
  }
}
