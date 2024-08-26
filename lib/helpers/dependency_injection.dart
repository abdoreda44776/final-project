import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:iti_final_project/helpers/api_service.dart';
import 'package:iti_final_project/helpers/dio_setup.dart';
import 'package:iti_final_project/modules/home/data/repo/home_repo.dart';
import 'package:iti_final_project/modules/home/presentation/cubit/get_products_cubit/get_products_cubit.dart';
import 'package:iti_final_project/modules/layout/data/repo/layout_repo.dart';
import 'package:iti_final_project/modules/layout/presentation/cubit/get_categories/get_categories_cubit.dart';
import 'package:iti_final_project/modules/login/data/repo/login_repo.dart';
import 'package:iti_final_project/modules/login/presentation/cubit/login/login_cubit.dart';
import 'package:iti_final_project/modules/profile/data/repo/profile_repo.dart';
import 'package:iti_final_project/modules/profile/presentation/cubit/get_profile_data/get_profile_data_cubit.dart';
import 'package:iti_final_project/modules/profile/presentation/cubit/logout/logout_cubit.dart';
import 'package:iti_final_project/modules/register/data/repo/register_repo.dart';
import 'package:iti_final_project/modules/register/presentation/cubit/create_user/create_user_cubit.dart';
import 'package:iti_final_project/modules/register/presentation/cubit/register/register_cubit.dart';
import 'package:iti_final_project/modules/single_category/presentation/cubit/get_single_category/get_single_category_cubit.dart';
import 'package:iti_final_project/modules/single_category/repo/single_category_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // web services
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(
      DioSetup.createAndSetUpDio(),
    ),
  );

  // firebase
  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // layout
  getIt.registerLazySingleton<LayoutRepo>(
    () => LayoutRepo(
      getIt(),
    ),
  );

  // get categories cubit
  getIt.registerFactory<GetCategoriesCubit>(
    () => GetCategoriesCubit(
      getIt(),
    ),
  );

  // home
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(
      getIt(),
    ),
  );

  // get products cubit
  getIt.registerFactory<GetProductsCubit>(
    () => GetProductsCubit(
      getIt(),
    ),
  );

  // single category
  getIt.registerLazySingleton<SingleCategoryRepo>(
    () => SingleCategoryRepo(
      getIt(),
    ),
  );

  // get single category products cubit
  getIt.registerFactory<GetSingleCategoryCubit>(
    () => GetSingleCategoryCubit(
      getIt(),
    ),
  );

  // login
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(
      getIt(),
    ),
  );

  // login cubit
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt(),
    ),
  );

  // register
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepo(
      getIt(),
      getIt(),
    ),
  );

  // register cubit
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(
      getIt(),
    ),
  );

  // create user cubit
  getIt.registerFactory<CreateUserCubit>(
    () => CreateUserCubit(
      getIt(),
    ),
  );

  // profile
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepo(
      getIt(),
      getIt(),
    ),
  );

  // get profile cubit
  getIt.registerFactory<GetProfileDataCubit>(
    () => GetProfileDataCubit(
      getIt(),
    ),
  );

  // logout cubit
  getIt.registerFactory<LogoutCubit>(
    () => LogoutCubit(
      getIt(),
    ),
  );
}
