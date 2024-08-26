import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/my_styles.dart';
import 'package:iti_final_project/models/onboarding_model.dart';

class CustomPageView extends StatelessWidget {
  final List<OnboardingModel> onboardingItems;
  final PageController pageController;

  const CustomPageView({
    super.key,
    required this.onboardingItems,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                onboardingItems[index].image,
                height: 350.h,
                width: 280.w,
              ),
              SizedBox(height: 30.h),
              Text(
                onboardingItems[index].title,
                style: MyStyles.font35MainBlueSemiBold,
              ),
              SizedBox(height: 5.h),
              Text(
                onboardingItems[index].subTitle,
                style: MyStyles.font16BlackRegular,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
      itemCount: onboardingItems.length,
    );
  }
}
