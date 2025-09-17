import 'package:flutter/material.dart';
import 'package:untitled1/model/product.dart';
import 'package:untitled1/res/app_icons.dart';
import 'package:untitled1/screens/details/tabs/product_tab0.dart';
import 'package:untitled1/screens/details/tabs/product_tab1.dart';
import 'package:untitled1/screens/details/tabs/product_tab2.dart';
import 'package:untitled1/screens/details/tabs/product_tab3.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    Product product = generateProduct();

    return ProductProvider(
      product: product,
      child: Scaffold(
        body: Stack(
          children: [
            Offstage(offstage: _currentTab != 0, child: const ProductTab0()),
            Offstage(offstage: _currentTab != 1, child: ProductTab1()),
            Offstage(offstage: _currentTab != 2, child: ProductTab2()),
            Offstage(offstage: _currentTab != 3, child: ProductTab3()),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: (int tab) {
            setState(() {
              _currentTab = tab;
            });
          },
          items: ProductDetailsCurrentTab.values
              .map((ProductDetailsCurrentTab tab) {
                return BottomNavigationBarItem(
                  label: tab.label,
                  icon: Icon(tab.icon),
                );
              })
              .toList(growable: false),
        ),
      ),
    );
  }
}

enum ProductDetailsCurrentTab {
  summary('Fiche', AppIcons.tab_barcode),
  info('Caractéristiques', AppIcons.tab_fridge),
  nutrition('Nutrition', AppIcons.tab_nutrition),
  nutritionalValues('Tableau', AppIcons.tab_array);

  final String label;
  final IconData icon;

  const ProductDetailsCurrentTab(this.label, this.icon);
}

class ProductProvider extends InheritedWidget {
  const ProductProvider({
    super.key,
    required this.product,
    required super.child,
  });

  final Product product;

  static ProductProvider of(BuildContext context) {
    final ProductProvider? result = context
        .dependOnInheritedWidgetOfExactType<ProductProvider>();
    assert(result != null, 'No ProductProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProductProvider old) {
    return product != product;
  }
}
