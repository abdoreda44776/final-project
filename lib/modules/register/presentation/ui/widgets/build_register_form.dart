import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/app_regex.dart';
import 'package:iti_final_project/helpers/custom_text_form_field.dart';
import 'package:iti_final_project/helpers/my_colors.dart';
import 'package:iti_final_project/modules/register/presentation/cubit/register/register_cubit.dart';
import 'package:iti_final_project/modules/register/presentation/ui/widgets/register_bloc_consumer.dart';

class BuildRegisterForm extends StatefulWidget {
  const BuildRegisterForm({super.key});

  @override
  State<BuildRegisterForm> createState() => _BuildRegisterFormState();
}

class _BuildRegisterFormState extends State<BuildRegisterForm> {
  bool passwordIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            text: 'User Name',
            controller: context.read<RegisterCubit>().nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'User name must not be empty';
              }
              return null;
            },
          ),
          SizedBox(height: 29.h),
          CustomTextFormField(
            text: 'Email',
            controller: context.read<RegisterCubit>().emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email must not be empty';
              } else if (!AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 29.h),
          CustomTextFormField(
            text: 'Password',
            controller: context.read<RegisterCubit>().passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password must not be empty';
              } else if (value.length < 6) {
                return 'Password is too short';
              }
              return null;
            },
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
          SizedBox(height: 29.h),
          CustomTextFormField(
            text: 'Confirm Password',
            controller: context.read<RegisterCubit>().confirmPasswordController,
            obscureText: !passwordIsVisible,
            validator: (value) {
              if (context
                      .read<RegisterCubit>()
                      .confirmPasswordController
                      .text !=
                  context.read<RegisterCubit>().passwordController.text) {
                return 'Password doesn\'t match';
              }
              return null;
            },
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
          SizedBox(height: 53.h),
          const RegisterBlocConsumer(),
        ],
      ),
    );
  }
}
