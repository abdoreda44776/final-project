import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/my_colors.dart';
import 'package:iti_final_project/helpers/my_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final bool requestLoading;

  const CustomTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    required this.requestLoading,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? MyColors.mainRed,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        minimumSize: WidgetStateProperty.all(
          Size(
            double.infinity,
            60.h,
          ),
        ),
        shadowColor: MaterialStateProperty.all(
          Colors.grey,
        ),
        elevation: MaterialStateProperty.all(
          8,
        ),
      ),
      child: requestLoading == false
          ? Text(
              text,
              style: backgroundColor == null
                  ? MyStyles.font20WhiteSemiBold
                  : MyStyles.font16MainBlueSemiBold,
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
    );
  }
}
