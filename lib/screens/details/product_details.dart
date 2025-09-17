import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/res/app_icons.dart';
import 'package:untitled1/screens/details/product_bloc.dart';
import 'package:untitled1/screens/details/tabs/product_tab0.dart';
import 'package:untitled1/screens/details/tabs/product_tab1.dart';
import 'package:untitled1/screens/details/tabs/product_tab2.dart';
import 'package:untitled1/screens/details/tabs/product_tab3.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({required this.barcode, super.key})
    : assert(barcode.length > 0, 'Barcode cannot be empty');

  final String barcode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (_) => ProductBloc(barcode),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (BuildContext context, ProductState state) {
          return switch (state) {
            ProductLoadingState() => _ProductDetailsLoading(),
            ProductSuccessState() => _ProductDetailsBody(),
            ProductErrorState() => _ProductDetailsError(),
          };
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

class _ProductDetailsBody extends StatefulWidget {
  const _ProductDetailsBody();

  @override
  State<_ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<_ProductDetailsBody> {
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(offstage: _position != 0, child: ProductTab0()),
          Offstage(offstage: _position != 1, child: ProductTab1()),
          Offstage(offstage: _position != 2, child: ProductTab2()),
          Offstage(offstage: _position != 3, child: ProductTab3()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _position,
        onTap: (int position) => setState(() {
          _position = position;
        }),
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

class _ProductDetailsError extends StatelessWidget {
  const _ProductDetailsError();

  @override
  Widget build(BuildContext context) {
    final ProductBloc bloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              (bloc.state as ProductErrorState).error.toString(),
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
            SizedBox(height: 10.0),
            OutlinedButton(
              onPressed: () {
                // TODO
              },
              child: Text('Ré-essayer'),
            ),
          ],
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
