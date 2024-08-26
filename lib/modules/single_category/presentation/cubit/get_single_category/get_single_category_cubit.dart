import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:iti_final_project/models/product_model.dart';
import 'package:iti_final_project/modules/single_category/repo/single_category_repo.dart';

part 'get_single_category_state.dart';

class GetSingleCategoryCubit extends Cubit<GetSingleCategoryState> {
  final SingleCategoryRepo singleCategoryRepo;

  GetSingleCategoryCubit(this.singleCategoryRepo)
      : super(GetSingleCategoryInitial());

  Future getSingleCategoryProducts(String categoryName) async {
    emit(GetSingleCategoryLoading());
    var response =
        await singleCategoryRepo.getSingleCategoryProducts(categoryName);

    if (isClosed) {
      return;
    }

    response.fold(
      (failure) => emit(GetSingleCategoryFailure(failure.message)),
      (singleCategoryProducts) => emit(
        GetSingleCategorySuccess(singleCategoryProducts),
      ),
    );
  }
}
