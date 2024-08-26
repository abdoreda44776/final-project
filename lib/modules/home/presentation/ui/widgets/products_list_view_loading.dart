import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/custom_shimmer_loading.dart';

class ProductsListViewLoading extends StatelessWidget {
  const ProductsListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        margin: EdgeInsetsDirectional.only(
          bottom: 20.h,
          start: 20.w,
          end: 20.w,
        ),
        child: Row(
          children: [
            CustomShimmerLoading(
              child: Container(
                color: Colors.white,
                height: 120.h,
                width: 120.h,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomShimmerLoading(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      height: 25.h,
                      width: 250.h,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomShimmerLoading(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      height: 20.h,
                      width: 180.h,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      itemCount: 5,
    );
  }
}
