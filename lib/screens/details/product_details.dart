import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          Offstage(offstage: _currentTab != 0, child: ProductTab0()),
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tab_barcode),
            label: 'Fiche',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tab_fridge),
            label: 'Caractéristiques',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tab_nutrition),
            label: 'Nutrition',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tab_array),
            label: 'Tableau',
          ),
        ],
      ),
    );
  }
}
