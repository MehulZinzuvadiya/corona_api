import 'package:corona_api/Provider/home_provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'View/home_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
      )
    ],
    child: DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => Sizer(
        builder: (BuildContext context, Orientation orientation,
             deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const HomeScreen(),
            },
          );
        },
      ),
    ),
  ));
}
