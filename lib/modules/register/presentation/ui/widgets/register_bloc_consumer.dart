import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/helpers/constant.dart';
import 'package:iti_final_project/helpers/custom_text_button.dart';
import 'package:iti_final_project/helpers/custom_toasts.dart';
import 'package:iti_final_project/helpers/extensions.dart';
import 'package:iti_final_project/helpers/routes.dart';
import 'package:iti_final_project/helpers/shared_preferences.dart';
import 'package:iti_final_project/modules/register/presentation/cubit/create_user/create_user_cubit.dart';
import 'package:iti_final_project/modules/register/presentation/cubit/register/register_cubit.dart';
import 'package:iti_final_project/modules/register/presentation/cubit/register/register_state.dart';

class RegisterBlocConsumer extends StatelessWidget {
  const RegisterBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    bool requestLoading = false;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          requestLoading = true;
        } else if (state is RegisterSuccess) {
          Constants.token = state.userModel.token;
          MySharedPreferences.setString('token', state.userModel.token);
          context
              .read<CreateUserCubit>()
              .createUser(state.userModel)
              .then((value) {
            CustomToasts.showSuccessToast(
              successMessage: 'Login done successfully',
            );
            context.pushNamedAndRemoveUntil(
              Routes.layoutScreen,
              predicate: (route) => false,
            );
          });
          requestLoading = false;
        } else if (state is RegisterFailure) {
          CustomToasts.showErrorToast(
            errorMessage: state.errorMessage,
          );
          requestLoading = false;
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          text: 'Register',
          requestLoading: requestLoading,
          onPressed: () {
            if (context
                .read<RegisterCubit>()
                .formKey
                .currentState!
                .validate()) {
              context.read<RegisterCubit>().register();
            }
          },
        );
      },
    );
  }
}
