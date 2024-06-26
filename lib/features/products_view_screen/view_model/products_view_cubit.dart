import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'products_view_state.dart';

class ProductsViewCubit extends Cubit<ProductsViewState> {
  ProductsViewCubit() : super(ProductsViewInitial());
  static ProductsViewCubit get(context) => BlocProvider.of(context);

  bool isGridView = true;
  String dropdownValue = 'Popularity';
  List<String> items = [
    'Popularity',
    'New in',
    'Best Rating',
    'Lowest Price',
    'Highest Price'
  ];

  void changeProductsViewStyle() {
    isGridView = !isGridView;
    emit(ChangeProductsViewStyleState());
  }

  void updateDropdownValue(String newValue) {
    dropdownValue = newValue;
    emit(ProductsViewDropdownChangedState(newValue));
  }
}
