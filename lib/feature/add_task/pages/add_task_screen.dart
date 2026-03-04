import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:svg_flutter/svg.dart';
import 'package:taskati/core/constant/app_images.dart';
import 'package:taskati/core/functions/extensions.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/feature/add_task/widgets/card_for_tasks.dart';
import 'package:taskati/feature/home/pages/home_screen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key, this.task});
  final TaskModel? task;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late String _date = _date;
  late String _startTime = _startTime;
  late String _endTime = _endTime;
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.task?.title ?? "");
    _descriptionController = TextEditingController(
      text: widget.task?.description ?? "",
    );
    _date =
        widget.task?.date ?? DateFormat("dd MMM, yyyy").format(DateTime.now());
    _startTime =
        widget.task?.startTime ?? DateFormat("hh:mm a").format(DateTime.now());
    _endTime =
        widget.task?.endTime ?? DateFormat("hh:mm a").format(DateTime.now());
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigations.pop(context);
          },
          icon: SvgPicture.asset(
            AppImages.backSvg,
            width: 24,
            height: 24,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: Text(widget.task != null ? "Edit" : "Add Task"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title", style: TextStyles.caption1),
              Gap(8),
              CustomTextFormField(controller: _titleController),
              Gap(18),
              Text("Description", style: TextStyles.caption1),
              Gap(8),
              CustomTextFormField(
                maxLines: 4,
                minLines: 4,
                controller: _descriptionController,
              ),
              Gap(41),
              CardForTasks(
                path: AppImages.calendar,
                title: "Time",
                date: _date,
                onTap: () async {
                  var selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _date = DateFormat("dd MMM, yyyy").format(selectedDate);
                    });
                  }
                },
              ),
              24.H,
              CardForTasks(
                path: AppImages.timeSvg,
                title: "Start Time",
                date: _startTime,
                onTap: () => selectTime(true),
              ),
              24.H,
              CardForTasks(
                path: AppImages.timeSvg,
                title: "End Time",
                date: _endTime,
                onTap: () => selectTime(false),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: MainButton(
          text: widget.task != null ? "Save " : "Add Task",
          onPressed: () {
            if (widget.task != null) {
              HiveHelper.cashTaskData(
                widget.task!.id,
                TaskModel(
                  id: widget.task!.id,
                  title: _titleController.text,
                  description: _descriptionController.text,
                  date: _date,
                  startTime: _startTime,
                  isCompleted: false,
                  endTime: _endTime,
                ),
              );
            } else {
              String id = DateTime.now().millisecondsSinceEpoch.toString();
              HiveHelper.cashTaskData(
                id,
                TaskModel(
                  id: id,
                  title: _titleController.text,
                  description: _descriptionController.text,
                  date: _date,
                  startTime: _startTime,
                  isCompleted: false,
                  endTime: _endTime,
                ),
              );
            }
            Navigations.pushReplacement(context, HomeScreen());
          },
        ),
      ),
    );
  }

  Future<void> selectTime(bool isStart) async {
    var startOfTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (startOfTime != null) {
      var timeFormat = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        startOfTime.hour,
        startOfTime.minute,
      );
      if (isStart) {
        setState(() {
          _startTime = DateFormat("hh:mm a").format(timeFormat);
        });
      } else {
        setState(() {
          _endTime = DateFormat("hh:mm a").format(timeFormat);
        });
      }
    }
  }
}
