import 'package:flutter/material.dart';
import 'package:taskati/core/constant/app_images.dart';
import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/core/styles/themes.dart';
import 'package:taskati/feature/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      builder: (context, child) {
        return SafeArea(
          bottom: false,
          top: false,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
              ),
              Image.asset(
                AppImages.bg,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              child ?? Container(),
            ],
          ),
        );
      },
      home: SplashScreen(),
    );
  }
}
