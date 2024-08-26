import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/helpers/my_colors.dart';
import 'package:iti_final_project/helpers/my_styles.dart';
import 'package:iti_final_project/modules/profile/presentation/cubit/get_profile_data/get_profile_data_cubit.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
              builder: (context, state) {
                if (state is GetProfileDataSuccess) {
                  return Text(
                    'Hi, ${state.userModel.userName}..',
                    style: MyStyles.font22BlackRegular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                } else {
                  return Text(
                    'Hi,',
                    style: MyStyles.font22BlackRegular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                }
              },
            ),
          ),
          FaIcon(
            FontAwesomeIcons.bell,
            color: MyColors.mainRed,
            size: 28.sp,
          ),
        ],
      ),
    );
  }
}
