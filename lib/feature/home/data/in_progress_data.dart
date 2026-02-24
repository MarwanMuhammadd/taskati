import 'package:flutter/material.dart';
import 'package:taskati/core/styles/app_colors.dart';

class InProgressData {
  final String title;
  final String description;
  final bool isCompleted;
  final Color containerColor;

  InProgressData({
    required this.title,
    required this.description,
    this.containerColor=AppColors.orangeColor,
    this.isCompleted = false,
  });
}

List<InProgressData> inProgressData = [
  InProgressData(
    title: "Market Research",
    description: "Research competitors and analyze user needs",
  ),
  InProgressData(
    title: "Wireframe Design",
    description: "Create wireframes for main screens",
  ),
  InProgressData(
    title: "UI Implementation",
    description: "Convert Figma design into Flutter widgets",
  ),
  InProgressData(
    title: "State Management",
    description: "Implement Cubit or Provider for task logic",
  ),
  InProgressData(
    title: "Local Database Setup",
    description: "Configure Hive for storing tasks locally",
  ),
  InProgressData(
    title: "Performance Optimization",
    description: "Improve scrolling and widget rebuild performance",
  ),
];