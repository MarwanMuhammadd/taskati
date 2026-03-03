import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:svg_flutter/svg.dart';
import 'package:taskati/core/constant/app_images.dart';
import 'package:taskati/core/functions/extensions.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/core/widgets/tap_button.dart';
import 'package:taskati/feature/home/pages/home_screen.dart';

class CompletePage extends StatefulWidget {
  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  String? path;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Complete Your Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              40.H,
              Row(
                children: [
                  Text(
                    "Profile Image",
                    style: TextStyles.caption1.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
              Gap(20),
              _profileImage(),
              Gap(34),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(
                    text: "From Camera",
                    onPressed: () async {
                      var image = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                      );
                      if (image != null) {
                        setState(() {
                          path = image.path;
                        });
                      }
                    },
                  ),
                  12.W,
                  TabButton(
                    text: "From Gallery",
                    onPressed: () async {
                      var image = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image != null) {
                        setState(() {
                          path = image.path;
                        });
                      }
                    },
                  ),
                ],
              ),
              30.H,
              Row(
                children: [
                  Text(
                    "Your Name",
                    style: TextStyles.caption1.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
              10.H,
              CustomTextFormField(controller: controller),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MainButton(
          text: "Let's Start",
          onPressed: () async {
            if (path != null && controller.text.isNotEmpty) {
              await HiveHelper.setData(controller.text, path!);
              await HiveHelper.cashData(HiveHelper.isUploadedKey, true);
              Navigations.pushReplacement(context, HomeScreen());
            } else if (path != null && controller.text.isEmpty) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Enter your Text")));
            } else if (path == null && controller.text.isNotEmpty) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Enter  your Image")));

              Navigations.pushReplacement(context, HomeScreen());
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Enter your Text and your Image")),
              );
            }
          },
        ),
      ),
    );
  }

  Stack _profileImage() {
    return Stack(
      children: [
        ClipOval(
          child: path == null
              ? Image.asset(
                  AppImages.user,
                  width: 185,
                  height: 185,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  File(path!),
                  width: 185,
                  height: 185,
                  fit: BoxFit.cover,
                ),

          // radius: 85,
          // child: path == null
          //     ? Image.asset(AppImages.user)
          //     : Image.file(File(path!)),
        ),
        if (path != null)
          Positioned(
            right: 5,
            bottom: 5,
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog.adaptive(
                    title: Text("Delete Image"),
                    content: Text("Are you sure you wnat to delete the image?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            path = null;
                          });
                          Navigator.pop(context);
                        },
                        child: Text("Yes"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("No"),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.blackColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    AppImages.deleteSvg,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
