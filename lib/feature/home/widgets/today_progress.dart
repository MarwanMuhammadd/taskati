import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/extensions.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class TodayProgress extends StatelessWidget {
  const TodayProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 14,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.MMMEd().format(DateTime.now()),
                    style: TextStyles.caption1.copyWith(
                      color: AppColors.backgroundColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  10.H,
                  Text(
                    "Your today’s task almost complete ",
                    style: TextStyles.caption1.copyWith(
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ],
              ),
            ),
            20.W,
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  backgroundColor: Color(0xff8764FF),
                  strokeCap: StrokeCap.round,
                  constraints: BoxConstraints(
                    minHeight: 76,
                    minWidth: 76,
                    maxHeight: 76,
                    maxWidth: 76,
                  ),
                  strokeWidth: 9,
                  value: .85,
                  color: AppColors.backgroundColor,
                ),
                Text(
                  "85%",
                  style: TextStyles.body.copyWith(
                    color: AppColors.backgroundColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
