import 'package:dio/dio.dart';
import 'package:iti_final_project/helpers/end_points.dart';
import 'package:iti_final_project/helpers/failure.dart';
import 'package:iti_final_project/helpers/server_failure.dart';
import 'package:iti_final_project/helpers/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:iti_final_project/models/product_model.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo(this.apiService);

  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      List<ProductModel> products = [];
      final response = await apiService.get(endPoint: EndPoints.products);
      for (var item in response['products']) {
        products.add(ProductModel.fromJson(item));
      }
      return Right(products);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
