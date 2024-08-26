import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/my_styles.dart';
import 'package:iti_final_project/models/product_model.dart';

class ProductListViewItem extends StatelessWidget {
  final ProductModel productModel;

  const ProductListViewItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        bottom: 20.h,
        start: 20.w,
        end: 20.w,
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: productModel.image,
            fit: BoxFit.fill,
            height: 120.h,
            width: 120.h,
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title,
                  style: MyStyles.font18BlackSemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Text(
                  productModel.description,
                  style: MyStyles.font14BlackRegular,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
