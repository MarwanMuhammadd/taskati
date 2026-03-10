import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:svg_flutter/svg.dart';
import 'package:taskati/core/constant/app_images.dart';
import 'package:taskati/core/functions/extensions.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/feature/add_task/pages/add_task_screen.dart';

class AllTaskWidget extends StatefulWidget {
  final List<TaskModel> tasks;
  const AllTaskWidget({super.key, required this.tasks});

  @override
  State<AllTaskWidget> createState() => _AllTaskWidgetState();
}

class _AllTaskWidgetState extends State<AllTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => 18.H,
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        final item = widget.tasks[index];

        return CardItem(task: item);
      },
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key:  ValueKey(task.id),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(
          onDismissed: () {
            HiveHelper.taskBox.delete(task.id);
          },
        ),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              HiveHelper.taskBox.delete(task.id);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: (context) {
              HiveHelper.cashTaskData(
                task.id,
                task.copyWith(isCompleted: true),
              );
            },
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.done,
            label: 'Completed',
          ),
          SlidableAction(
            onPressed: (context) {
              Navigations.pushTo(context, AddTaskScreen(task: task));
            },
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 4,
              color: (HiveHelper.getData(HiveHelper.isDarkKey) ?? false)
                  ? AppColors.blackColor
                  : AppColors.accentColor,
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: TextStyles.body.copyWith(
                  // color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                task.description,
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
                    "${task.startTime}- ${task.endTime}",
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
                      backgroundColor: task.isCompleted
                          ? AppColors.accentColor
                          : AppColors.lightOrangeColor,
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        task.isCompleted ? "Done" : "In Progress",
                        style: TextStyles.caption2.copyWith(
                          color: task.isCompleted
                              ? AppColors.primaryColor
                              : AppColors.orangeColor,
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
