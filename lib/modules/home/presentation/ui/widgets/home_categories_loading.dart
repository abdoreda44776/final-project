import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/custom_shimmer_loading.dart';

class HomeCategoriesLoading extends StatelessWidget {
  const HomeCategoriesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => CustomShimmerLoading(
        child: Container(
          height: 60.h,
          width: 100.w,
          margin: EdgeInsetsDirectional.only(end: 20.w, bottom: 10.h),
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
        ),
      ),
      itemCount: 5,
    );
  }
}
