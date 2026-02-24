import 'package:flutter/material.dart';
import 'package:taskati/core/styles/app_colors.dart';

class AllTaskData {
  final String title;
  final String description;
  final bool isCompleted;
  final Color containerColor;

  AllTaskData({
    required this.title,
    required this.description,
    this.containerColor=AppColors.accentprimaryColor,
    this.isCompleted = false,
  });
}

List<AllTaskData> allTaskData = [
  AllTaskData(
    title: "Market Research",
    description: "Research competitors and analyze user needs",
  ),
  AllTaskData(
    title: "UI Design",
    description: "Design main screens for Taskati app",
  ),
  AllTaskData(
    title: "Implement Task Screen",
    description: "Build task list UI using Flutter",
  ),
  AllTaskData(
    title: "Connect Local Storage",
    description: "Save tasks using SharedPreferences or Hive",
  ),
  AllTaskData(
    title: "Testing",
    description: "Test adding, deleting, and updating tasks",
  ),
];
