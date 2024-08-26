import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/app_regex.dart';
import 'package:iti_final_project/helpers/custom_text_form_field.dart';
import 'package:iti_final_project/helpers/my_colors.dart';
import 'package:iti_final_project/helpers/my_styles.dart';
import 'package:iti_final_project/modules/login/presentation/cubit/login/login_cubit.dart';
import 'package:iti_final_project/modules/login/presentation/ui/widgets/login_bloc_consumer.dart';

class BuildLoginForm extends StatefulWidget {
  const BuildLoginForm({super.key});

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  bool passwordIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email must not be empty';
              } else if (!AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            text: 'Email',
          ),
          SizedBox(height: 29.h),
          CustomTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password must not be empty';
              }
              return null;
            },
            text: 'Password',
            obscureText: !passwordIsVisible,
            suffixIcon: GestureDetector(
              onTap: () {
                passwordIsVisible = !passwordIsVisible;
                setState(() {});
              },
              child: Icon(
                !passwordIsVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: MyColors.mainRed,
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              'Forgot Your Password ?',
              style: MyStyles.font14MainBlueSemiBold,
            ),
          ),
          SizedBox(height: 30.h),
          const LoginBlocConsumer(),
        ],
      ),
    );
  }
}
