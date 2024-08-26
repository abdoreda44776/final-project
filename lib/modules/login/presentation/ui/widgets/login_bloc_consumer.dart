import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/helpers/constant.dart';
import 'package:iti_final_project/helpers/custom_text_button.dart';
import 'package:iti_final_project/helpers/custom_toasts.dart';
import 'package:iti_final_project/helpers/extensions.dart';
import 'package:iti_final_project/helpers/routes.dart';
import 'package:iti_final_project/helpers/shared_preferences.dart';
import 'package:iti_final_project/modules/login/presentation/cubit/login/login_cubit.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    bool requestLoading = false;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          requestLoading = true;
        } else if (state is LoginSuccess) {
          Constants.token = state.token;
          MySharedPreferences.setString('token', state.token);
          CustomToasts.showSuccessToast(
            successMessage: 'Login done successfully',
          );
          context.pushNamedAndRemoveUntil(
            Routes.layoutScreen,
            predicate: (route) => false,
          );
          requestLoading = false;
        } else if (state is LoginFailure) {
          CustomToasts.showErrorToast(
            errorMessage: state.errorMessage,
          );
          requestLoading = false;
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          text: 'Login',
          requestLoading: requestLoading,
          onPressed: () {
            if (context.read<LoginCubit>().formKey.currentState!.validate()) {
              context.read<LoginCubit>().login();
            }
          },
        );
      },
    );
  }
}
