import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/extensions.dart';
import 'package:iti_final_project/helpers/my_styles.dart';
import 'package:iti_final_project/helpers/routes.dart';
import 'package:iti_final_project/modules/home/presentation/ui/widgets/home_categories_loading.dart';
import 'package:iti_final_project/modules/layout/presentation/cubit/get_categories/get_categories_cubit.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
        builder: (context, state) {
          if (state is GetCategoriesSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  context.pushNamed(
                    Routes.singleCategoryScreen,
                    arguments: state.categories[index].slug,
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  margin: EdgeInsetsDirectional.only(end: 20.w, bottom: 10.h),
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                  child: Center(
                    child: Text(
                      state.categories[index].name,
                      style: MyStyles.font18BlackRegular,
                    ),
                  ),
                ),
              ),
              itemCount: state.categories.length,
            );
          } else if (state is GetCategoriesFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: MyStyles.font22BlackRegular,
              ),
            );
          } else {
            return const HomeCategoriesLoading();
          }
        },
      ),
    );
  }
}
