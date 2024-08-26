import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/my_colors.dart';
import 'package:iti_final_project/helpers/my_styles.dart';
import 'package:iti_final_project/modules/profile/presentation/cubit/get_profile_data/get_profile_data_cubit.dart';
import 'package:iti_final_project/modules/profile/presentation/ui/widgets/logout_field.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
          builder: (context, state) {
            if (state is GetProfileDataSuccess) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: MyColors.mainRed,
                    child: Text(
                      state.userModel.userName[0],
                      style: MyStyles.font35WhiteBold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    state.userModel.userName,
                    style: MyStyles.font22BlackRegular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    state.userModel.email,
                    style: MyStyles.font18BlackRegular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 40.h),
                  const LogoutField(),
                  SizedBox(height: 80.h),
                ],
              );
            } else if (state is GetProfileDataFailure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: MyStyles.font22BlackRegular,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: MyColors.mainRed,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
