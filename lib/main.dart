import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:taskati/core/constant/app_images.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/themes.dart';
import 'package:taskati/feature/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await SharedPref.init();
  await Hive.initFlutter();
  await HiveHelper.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.userBox.listenable(),
      builder: (context, value, child) {
        bool isDarkMode = HiveHelper.getData(HiveHelper.isDarkKey) == true;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          builder: (context, child) {
            return SafeArea(
              bottom: false,
              top: false,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: isDarkMode
                        ? AppColors.blackColor
                        : AppColors.backgroundColor,
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
      },
    );
  }
}
