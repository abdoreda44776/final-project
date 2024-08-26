import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/my_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.5.h,
      color: MyColors.mainRed.withOpacity(.5),
      indent: 20.w,
      endIndent: 20.w,
    );
  }
}
