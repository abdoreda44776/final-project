part of 'get_single_category_cubit.dart';

@immutable
sealed class GetSingleCategoryState {}

final class GetSingleCategoryInitial extends GetSingleCategoryState {}

final class GetSingleCategoryLoading extends GetSingleCategoryState {}

final class GetSingleCategorySuccess extends GetSingleCategoryState {
  final List<ProductModel> singleCategoryProducts;

  GetSingleCategorySuccess(this.singleCategoryProducts);
}

final class GetSingleCategoryFailure extends GetSingleCategoryState {
  final String errorMessage;

  GetSingleCategoryFailure(this.errorMessage);
}
