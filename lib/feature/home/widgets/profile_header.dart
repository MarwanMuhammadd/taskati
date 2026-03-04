import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constant/app_images.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/text_styles.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  String name = "";
  String path = "";

  @override
  @override
  void initState() {
    super.initState();
    getCashedData();
  }

  Future<void> getCashedData() async {
    name = HiveHelper.getData(HiveHelper.nameKey);
    path = HiveHelper.getData(HiveHelper.imageKey);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.file(
            File(path),
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(AppImages.user);
            },
          ),
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello!", style: TextStyles.body),
            Text(name, style: TextStyles.headline),
          ],
        ),
        Spacer(),
        InkWell(
          onTap: () {
            bool isDarkMode = HiveHelper.getData(HiveHelper.isDarkKey) == true;
            HiveHelper.cashData(HiveHelper.isDarkKey, !isDarkMode);
            setState(() {});
          },
          child: Icon(
            HiveHelper.getData(HiveHelper.isDarkKey)
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
        ),
      ],
    );
  }
}
