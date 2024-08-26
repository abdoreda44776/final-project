import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/helpers/app_router.dart';
import 'package:iti_final_project/helpers/constant.dart';
import 'package:iti_final_project/helpers/my_assets.dart';
import 'package:iti_final_project/helpers/routes.dart';

class ECommerceApp extends StatelessWidget {
  final AppRouter appRouter;

  const ECommerceApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: MyAssets.appFontFamily,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        initialRoute: Constants.token == ''
            ? Constants.isFirstTimeToOpenApp == true
                ? Routes.onBoardingScreen
                : Routes.loginScreen
            : Routes.layoutScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
