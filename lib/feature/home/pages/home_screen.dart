import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/functions/extensions.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/feature/add_task/pages/add_task_screen.dart';
import 'package:taskati/feature/home/widgets/all_task_widget.dart';
import 'package:taskati/feature/home/widgets/in_progress_widget.dart';
import 'package:taskati/feature/home/widgets/profile_header.dart';
import 'package:taskati/feature/home/widgets/today_progress.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final DatePickerController? controller = DatePickerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                ProfileHeader(),
                20.H,
                TodayProgress(),
                20.H,
                DatePicker(
                  controller: controller,
                  width: 64,
                  height: 90,
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColors.primaryColor,
                  selectedTextColor: Colors.white,
                  unselectedColor: AppColors.accentColor,

                  onDateChange: (date) {
                    // New date selected
                    // setState(() {
                    //   _selectedValue = date;
                    // });
                  },
                ),
                8.H,
                ButtonsTabBar(
                  unselectedBackgroundColor: AppColors.accentColor,
                  contentCenter: true,
                  buttonMargin: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  radius: 20,
                  backgroundColor: AppColors.primaryColor,
                  width: MediaQuery.of(context).size.width * .3,
                  borderColor: Colors.black,
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyles.caption2.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: [
                    Tab(text: "All Tasks"),
                    Tab(text: "In Progress"),
                    Tab(text: "Completed"),
                  ],
                ),
                20.H,
                Expanded(
                  child: TabBarView(
                    children: [
                      AllTaskWidget(),
                      InprogressWidget(),
                      InprogressWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.small(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
        ),
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Navigations.pushTo(context, AddTaskScreen());
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
