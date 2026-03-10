// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:taskati/core/constant/app_images.dart';
// import 'package:taskati/core/functions/navigations.dart';
// import 'package:taskati/core/services/hive_helper.dart';
// import 'package:taskati/core/styles/text_styles.dart';
// import 'package:taskati/feature/edit_profile/edit_profile.dart';

// class ProfileHeader extends StatefulWidget {
//   const ProfileHeader({super.key});

//   @override
//   State<ProfileHeader> createState() => _ProfileHeaderState();
// }

// class _ProfileHeaderState extends State<ProfileHeader> {
//   String name = "";
//   String path = "";

//   @override
//   void initState() {
//     super.initState();
//     getCashedData();
//   }

//   Future<void> getCashedData() async {
//     name = HiveHelper.getData(HiveHelper.nameKey) ?? "";
//     path = HiveHelper.getData(HiveHelper.imageKey) ?? "";
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         ClipOval(
//           child: Image.file(
//             File(path),
//             width: 50,
//             height: 50,
//             fit: BoxFit.cover,
//             errorBuilder: (context, error, stackTrace) {
//               return InkWell(
//                 onTap: () {
//                   Navigations.pushTo(context, EditProfile());
//                 },
//                 child: Image.asset(AppImages.user, width: 50, height: 70),
//               );
//             },
//           ),
//         ),
//         Gap(10),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Hello!", style: TextStyles.body),
//             Text(name, style: TextStyles.headline),
//           ],
//         ),
//         Spacer(),
//         InkWell(
//           onTap: () {
//             bool isDarkMode = HiveHelper.getData(HiveHelper.isDarkKey) == true;
//             HiveHelper.cashData(HiveHelper.isDarkKey, !isDarkMode);
//             setState(() {});
//           },
//           child: Icon(
//             (HiveHelper.getData(HiveHelper.isDarkKey) ?? false)
//                 ? Icons.dark_mode
//                 : Icons.light_mode,
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:taskati/core/constant/app_images.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/feature/edit_profile/edit_profile.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.userBox.listenable(),
      builder: (context, box, child) {

        String name = box.get(HiveHelper.nameKey) ?? "";
        String path = box.get(HiveHelper.imageKey) ?? "";

        return Row(
          children: [
            InkWell(
              onTap: () {
                Navigations.pushTo(context, const EditProfile());
              },
              child: ClipOval(
                child: path.isNotEmpty
                    ? Image.file(
                        File(path),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        AppImages.user,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
              ),
            ),

            const Gap(10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello!", style: TextStyles.body),
                Text(name.isNotEmpty ? name : "User", style: TextStyles.headline),
              ],
            ),

            const Spacer(),

            InkWell(
              onTap: () {
                bool isDarkMode = box.get(HiveHelper.isDarkKey) ?? false;
                HiveHelper.cashData(HiveHelper.isDarkKey, !isDarkMode);
              },
              child: Icon(
                (box.get(HiveHelper.isDarkKey) ?? false)
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            ),
          ],
        );
      },
    );
  }
}
