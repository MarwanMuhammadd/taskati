import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constant/app_images.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/feature/complete_page/pages/complete_page.dart';
import 'package:taskati/feature/home/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool isUploaded = HiveHelper.getData(HiveHelper.isUploadedKey) == true;
    isUploaded == false
        ? Future.delayed(Duration(seconds: 3), () {
            Navigations.pushReplacement(context, HomeScreen());
          })
        : Future.delayed(Duration(seconds: 3), () {
            Navigations.pushReplacement(context, CompletePage());
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.logoJson, height: 239),
            SizedBox(height: 12),
            Text("Taskati", style: TextStyles.headline),
            SizedBox(height: 18),
            Text(
              "It’s time to get organized",
              style: TextStyles.caption1.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
