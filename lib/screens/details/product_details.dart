import 'package:flutter/material.dart';
import 'package:untitled1/res/app_icons.dart';
import 'package:untitled1/screens/details/tabs/product_tab0.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductTab0(), // ?
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int tab) {},
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
