import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:iti_final_project/models/category_model.dart';
import 'package:iti_final_project/modules/layout/data/repo/layout_repo.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  final LayoutRepo layoutRepo;

  GetCategoriesCubit(this.layoutRepo) : super(GetCategoriesInitial());

  Future getCategories() async {
    emit(GetCategoriesLoading());
    var response = await layoutRepo.getCategories();

    if (isClosed) {
      return;
    }

    response.fold(
      (failure) => emit(GetCategoriesFailure(failure.message)),
      (categories) => emit(GetCategoriesSuccess(categories)),
    );
  }
}
