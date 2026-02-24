import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:taskati/core/constant/app_images.dart';
import 'package:taskati/core/functions/extensions.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/feature/home/data/in_progress_data.dart';

class InprogressWidget extends StatelessWidget {
  const InprogressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => 18.H,
      itemCount: inProgressData.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 4,
              color: AppColors.accentColor,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                inProgressData[index].title,
                style: TextStyles.body.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                inProgressData[index].description,
                style: TextStyles.caption1.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              10.H,
              Row(
                children: [
                  SvgPicture.asset(AppImages.timeSvg, width: 20, height: 20),
                  10.W,
                  Text(
                    "10:00 AM - 12:00 AM",
                    style: TextStyles.caption1.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: Color(0xffFFE9E1),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "In Progress",
                        style: TextStyles.caption2.copyWith(
                          color: AppColors.orangeColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
