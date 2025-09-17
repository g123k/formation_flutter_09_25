import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/res/app_icons.dart';
import 'package:untitled1/screens/details/product_notifier.dart';
import 'package:untitled1/screens/details/tabs/product_tab0.dart';
import 'package:untitled1/screens/details/tabs/product_tab1.dart';
import 'package:untitled1/screens/details/tabs/product_tab2.dart';
import 'package:untitled1/screens/details/tabs/product_tab3.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductNotifier(),
      child: Consumer<ProductNotifier>(
        builder: (_, ProductNotifier notifier, _) {
          if (notifier.product == null) {
            return const _ProductDetailsLoading();
          } else {
            return const _ProductDetailsBody();
          }
        },
      ),
    );
  }
}

class _ProductDetailsLoading extends StatelessWidget {
  const _ProductDetailsLoading();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
  }
}

class _ProductDetailsError extends StatelessWidget {
  const _ProductDetailsError();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Une erreur est survenue')));
  }
}

class _ProductDetailsBody extends StatefulWidget {
  const _ProductDetailsBody();

  @override
  State<_ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<_ProductDetailsBody> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
