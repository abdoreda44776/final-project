import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iti_final_project/helpers/extensions.dart';
import 'package:iti_final_project/helpers/my_styles.dart';
import 'package:iti_final_project/helpers/routes.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: MyStyles.font16BlackRegular,
          ),
          TextSpan(
            text: ' Login',
            style: MyStyles.font16MainBlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}
