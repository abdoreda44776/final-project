import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/models/product_model.dart';
import 'package:iti_final_project/modules/home/data/repo/home_repo.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  final HomeRepo homeRepo;

  GetProductsCubit(this.homeRepo) : super(GetProductsInitial());

  Future getProducts() async {
    emit(GetProductsLoading());
    var response = await homeRepo.getProducts();

    if (isClosed) {
      return;
    }

    response.fold(
      (failure) => emit(GetProductsFailure(failure.message)),
      (products) => emit(GetProductsSuccess(products)),
    );
  }
}
