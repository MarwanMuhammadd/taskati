import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/extensions.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

class TodayProgress extends StatelessWidget {
  const TodayProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.taskBox.listenable(),
      builder: (context, box, child) {
        List<TaskModel> dailyTasks = [];
        for (var task in box.values) {
          if (task.date == DateFormat("dd MMM, yyyy").format(DateTime.now())) {
            dailyTasks.add(task);
          }
        }
        final completedTasks = dailyTasks
            .where((task) => task.isCompleted)
            .toList();
        final lengthOfTasks = dailyTasks.length;
        double percent = dailyTasks.isEmpty
            ? 0
            : ((completedTasks.length / lengthOfTasks)) * 100;
        return Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
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
                      value: percent / 100,
                      color: AppColors.backgroundColor,
                    ),
                    Text(
                      "${percent.toStringAsFixed(0)}%",
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
      },
    );
  }
}
