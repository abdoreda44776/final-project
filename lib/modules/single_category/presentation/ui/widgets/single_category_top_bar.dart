import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/helpers/extensions.dart';
import 'package:iti_final_project/helpers/my_styles.dart';

class SingleCategoryTopBar extends StatelessWidget {
  const SingleCategoryTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.black,
            ),
          ),
          Text(
            'Category',
            style: MyStyles.font22BlackRegular,
          ),
        ],
      ),
    );
  }
}
