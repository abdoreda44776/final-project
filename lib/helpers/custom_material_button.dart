import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/helpers/my_colors.dart';

class CustomMaterialButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const CustomMaterialButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: MyColors.mainRed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
      minWidth: 30.w,
      child: FaIcon(
        icon,
        color: Colors.white,
        size: 25.sp,
      ),
    );
  }
}
