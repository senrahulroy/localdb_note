import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localdb_note/src/splash_screen.dart';
import 'package:localdb_note/utils/res/app_strings.dart';

void main() {
  /// Start app /
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

/// Root App Setup
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Implement Screen util for responsive
    ////
    return ScreenUtilInit(
      /// Fix size for app
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      /// builder Context for create new child
      builder: (context, child) {
        return MaterialApp(
          /// remove bannner
          debugShowCheckedModeBanner: false,

          /// App Name
          title: AppString.strAppName,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true),

          /// Start App Home Page
          home: const SplashScreen(),
        );
      },
    );
  }
}
