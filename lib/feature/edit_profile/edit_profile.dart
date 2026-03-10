import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:taskati/core/constant/app_images.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/core/widgets/tap_button.dart';

class EditProfile extends StatefulWidget {
  final Box? user;

  const EditProfile({super.key, this.user});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? selectedImage;
  final ImagePicker picker = ImagePicker();
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    String? imagePath = HiveHelper.getData(HiveHelper.imageKey);
    if (imagePath != null) {
      selectedImage = File(imagePath);
    }
    String name = HiveHelper.getData(HiveHelper.nameKey) ?? "";
    _nameController = TextEditingController(text: name);
  }

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.backSvg),
        ),
        title: Text("Profile", style: TextStyles.body),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile Image",
                style: TextStyles.caption1.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Gap(20),
              Center(
                child: Stack(
                  children: [
                    ClipOval(
                      child: selectedImage != null
                          ? Image.file(
                              selectedImage!,
                              width: 165,
                              height: 165,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              AppImages.user,
                              width: 165,
                              height: 165,
                            ),
                    ),
                  ],
                ),
              ),
              Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(
                    text: "From Camera",
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                  ),
                  Gap(8),
                  TabButton(
                    text: "From Gallery",
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
              Gap(40),
              Text(
                "Your Name",
                style: TextStyles.caption1.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Gap(10),
              CustomTextFormField(controller: _nameController),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30),
        child: MainButton(
          text: "Save",
          onPressed: () async {
            await HiveHelper.cashData(HiveHelper.nameKey, _nameController.text);
            if (selectedImage != null) {
              await HiveHelper.cashData(
                HiveHelper.imageKey,
                selectedImage!.path,
              );
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
