import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsup/resources/app_routes.dart';
import 'package:whatsup/utils/app_service.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => AppService());
}

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (context1, child) {
          return GetMaterialApp(
              title: "Whatsup",
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              debugShowCheckedModeBanner: false,
              navigatorKey: getNavigatorKey(),
              initialRoute: AppRoutes.chatDashboard,
              getPages: AppRoutes.getPages());
        });
  }
}
