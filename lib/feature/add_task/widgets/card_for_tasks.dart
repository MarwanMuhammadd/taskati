import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';
import 'package:taskati/core/constant/app_images.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class CardForTasks extends StatelessWidget {
  final String title;
  final String date;
  final String path;
  final void Function()? onTap;
  const CardForTasks({
    super.key,
    required this.title,
    required this.date,
    required this.path,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.secondaryColor.withAlpha(30),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SvgPicture.asset(path, width: 26, height: 26),
              Gap(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.caption2.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyles.caption1.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              SvgPicture.asset(AppImages.arrowDownSvg, width: 24, height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
