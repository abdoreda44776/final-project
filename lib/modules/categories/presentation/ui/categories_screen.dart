import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/my_styles.dart';
import 'package:iti_final_project/modules/categories/presentation/ui/widgets/categories_body.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Text(
            'Categories',
            style: MyStyles.font22BlackRegular,
          ),
        ),
        const CategoriesBody(),
      ],
    );
  }
}
