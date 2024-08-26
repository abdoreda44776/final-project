import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/helpers/custom_text_button.dart';
import 'package:iti_final_project/helpers/extensions.dart';
import 'package:iti_final_project/helpers/my_colors.dart';
import 'package:iti_final_project/helpers/my_styles.dart';
import 'package:iti_final_project/modules/profile/presentation/ui/widgets/logout_bloc_provider.dart';

class LogoutField extends StatelessWidget {
  const LogoutField({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) =>
              Dialog(
                backgroundColor: MyColors.lightGrey,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 15.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Logout', style: MyStyles.font20MainBlueSemiBold),
                      SizedBox(height: 5.h),
                      Text(
                        'Please make sure to Logout',
                        style: MyStyles.font18BlackRegular,
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomTextButton(
                              text: 'Cancel',
                              backgroundColor: Colors.white,
                              onPressed: () {
                                context.pop();
                              },
                              requestLoading: false,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          const Expanded(
                            child: LogoutBlocProvider(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        );
      },
      title: Text(
        'Logout',
        style: MyStyles.font20BlackRegular,
      ),
      trailing: const FaIcon(
        FontAwesomeIcons.chevronRight,
        color: Colors.black,
      ),
      contentPadding: EdgeInsetsDirectional.symmetric(
        vertical: 10.h,
        horizontal: 20.w,
      ),
    );
  }
}
