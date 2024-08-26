import 'package:flutter/material.dart';
import 'package:iti_final_project/helpers/constant.dart';
import 'package:iti_final_project/helpers/extensions.dart';
import 'package:iti_final_project/helpers/my_colors.dart';
import 'package:iti_final_project/helpers/routes.dart';
import 'package:iti_final_project/helpers/shared_preferences.dart';

class OnboardingButton extends StatelessWidget {
  final PageController pageController;

  const OnboardingButton({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: MyColors.mainRed,
      onPressed: () {
        Constants.isFirstTimeToOpenApp = false;
        MySharedPreferences.setBool('isFirstTimeToOpenApp', false);
        context.pushNamed(Routes.registerScreen);
      },
      child: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.white,
      ),
    );
  }
}
