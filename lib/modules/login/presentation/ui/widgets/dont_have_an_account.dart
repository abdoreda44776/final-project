import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iti_final_project/helpers/extensions.dart';
import 'package:iti_final_project/helpers/my_styles.dart';
import 'package:iti_final_project/helpers/routes.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: MyStyles.font16BlackRegular,
          ),
          TextSpan(
            text: ' Register',
            style: MyStyles.font16MainBlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.registerScreen);
              },
          ),
        ],
      ),
    );
  }
}
