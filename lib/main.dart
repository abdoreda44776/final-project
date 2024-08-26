import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iti_final_project/e-commerce.dart';
import 'package:iti_final_project/firebase_options.dart';
import 'package:iti_final_project/helpers/app_router.dart';
import 'package:iti_final_project/helpers/dependency_injection.dart';
import 'package:iti_final_project/helpers/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  runApp(ECommerceApp(appRouter: AppRouter()));
}
