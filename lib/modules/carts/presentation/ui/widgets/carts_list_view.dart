import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_final_project/helpers/my_styles.dart';

class CartsListView extends StatelessWidget {
  const CartsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => Dismissible(
          key: const Key('1'),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const FaIcon(
              FontAwesomeIcons.trashCan,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) {
            print(index);
          },
          child: Container(
            margin: EdgeInsetsDirectional.only(
              bottom: 20.h,
              start: 20.w,
              end: 20.w,
            ),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl:
                  'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png',
                  fit: BoxFit.fill,
                  height: 120.h,
                  width: 120.h,
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Essence Mascara Lash Princess',
                        style: MyStyles.font18BlackSemiBold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '\$ 100',
                        style: MyStyles.font22BlackRegular,
                      ),
                    ],
                  ),
                ),
                Text(
                  '1',
                  style: MyStyles.font22BlackBold,
                ),
              ],
            ),
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
