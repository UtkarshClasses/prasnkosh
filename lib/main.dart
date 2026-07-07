import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:teach_advance/screens/entry_screen.dart';

import 'screens/authentication.dart';
void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icon color
    systemNavigationBarIconBrightness:
        Brightness.dark, // color of navigation controls
  ));
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  configLoading();



// You can request multiple permissions at once.
//   Map<Permission, PermissionStatus> statuses = await [
//     Permission.location,
//   ].request();

  // if (await Permission.location.request().isGranted) {
    runApp(const MyApp());

  // } else {
  //   await Permission.location.onDeniedCallback(() {
  //     // Your code
  //   }).onGrantedCallback(() {
  //     // Your code
  //     runApp(const MyApp());
  //   }).onPermanentlyDeniedCallback(() {
  //     // Your code
  //   }).onRestrictedCallback(() {
  //     // Your code
  //   }).onLimitedCallback(() {
  //     // Your code
  //   }).onProvisionalCallback(() {
  //     // Your code
  //   }).request();
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userDetails = GetStorage();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'prasnKOSH',
      home: (userDetails.read("token") == null)
          ? const Authentication()
          : EntryScreen(
              selectedTab: 1,
            ),
      builder: EasyLoading.init(),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..dismissOnTap = false
    ..userInteractions = false
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..textStyle = const TextStyle(fontFamily: "serif")
    ..toastPosition = EasyLoadingToastPosition.bottom;
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
