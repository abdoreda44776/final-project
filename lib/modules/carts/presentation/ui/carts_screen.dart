import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/custom_text_button.dart';
import 'package:iti_final_project/helpers/my_colors.dart';
import 'package:iti_final_project/helpers/my_styles.dart';
import 'package:iti_final_project/modules/carts/presentation/ui/widgets/carts_list_view.dart';
import 'package:iti_final_project/modules/carts/presentation/ui/widgets/carts_top_bar.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CartsTapBar(),
            const CartsListView(),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: MyColors.lightGrey,
              ),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              child: Column(
                children: [
                  Text(
                    'Total Price :  \$ 3200',
                    style: MyStyles.font22BlackRegular,
                  ),
                  SizedBox(height: 5.h),
                  const CustomTextButton(
                    text: 'Buy Now',
                    requestLoading: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
