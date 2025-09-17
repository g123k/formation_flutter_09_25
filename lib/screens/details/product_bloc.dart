import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/api/model/product_response.dart';
import 'package:untitled1/api/openfoodfacts_api.dart';
import 'package:untitled1/model/product.dart';

abstract class ProductEvent {}

class LoadProductEvent extends ProductEvent {
  final String barcode;

  LoadProductEvent(this.barcode)
    : assert(barcode.isNotEmpty, 'Barcode cannot be empty');
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(String barcode) : super(ProductLoadingState()) {
    on<LoadProductEvent>(_onLoadProduct);
    add(LoadProductEvent(barcode));
  }

  Future<void> _onLoadProduct(
    LoadProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoadingState());
    try {
      final ProductAPIEntity response = await OpenFoodFactsAPIManager()
          .loadProduct(event.barcode);
      final Product product = response.response!.toProduct();
      emit(ProductSuccessState(product: product));
    } catch (err) {
      emit(ProductErrorState(error: err));
    }
  }
}

sealed class ProductState {
  const ProductState();
}

class ProductLoadingState extends ProductState {
  const ProductLoadingState();
}

class ProductSuccessState extends ProductState {
  final Product product;

  ProductSuccessState({required this.product});
}

class ProductErrorState extends ProductState {
  final dynamic error;

  ProductErrorState({required this.error});
}
