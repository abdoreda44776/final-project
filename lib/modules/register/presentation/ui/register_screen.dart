import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/my_styles.dart';
import 'package:iti_final_project/modules/register/presentation/ui/widgets/already_have_an_account.dart';
import 'package:iti_final_project/modules/register/presentation/ui/widgets/build_register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Text(
                  'Create Account',
                  style: MyStyles.font35MainBlueBold,
                ),
                SizedBox(height: 26.h),
                Text(
                  'Create an account so you can explore all the existing jobs',
                  style: MyStyles.font18BlackRegular,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 74.h),
                const BuildRegisterForm(),
                SizedBox(height: 30.h),
                const AlreadyHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
