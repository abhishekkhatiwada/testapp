import 'package:flutter/material.dart';
import 'package:testapp/app/app_colors.dart';
import 'package:testapp/common/utils/size_config.dart';
import 'package:testapp/common/widgets/custom_list_tile.dart';
import 'package:testapp/common/widgets/page_wrapper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return PageWrapper(
      title: "My Profile",
      appActions: [Icon(Icons.edit_rounded)],
      showBackButton: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: CircleAvatar(radius: 40)),
            SizedBox(height: 10.hp),
            Text("Alex", style: textTheme.headlineMedium),
            Text("Alexbaldwin123@gmail.com", style: textTheme.labelMedium),
            SizedBox(height: 14.hp),
            FilledListTile(
              onPressed: () {},
              title: "Parking Details",
              icon: Icons.list_alt_rounded,
            ),
            FilledListTile(
              title: "Language",
              icon: Icons.translate,

              onPressed: () {},
            ),
            FilledListTile(
              title: "Privacy Policy",
              icon: Icons.privacy_tip,
              onPressed: () {},
            ),
            FilledListTile(
              title: "Terms & Conditions",
              icon: Icons.description,
              onPressed: () {},
            ),
            FilledListTile(
              title: "Contact Us",
              icon: Icons.phone_in_talk,
              onPressed: () {},
            ),
            FilledListTile(
              title: "Help & Support",
              icon: Icons.help,
              onPressed: () {},
            ),
            SizedBox(height: 12.hp),
            FilledListTile(
              title: "Log Out",
              iconColor: AppColors.red,
              textColor: AppColors.red,
              icon: Icons.logout_outlined,
              onPressed: () {},
              bottomMargin: 12,
            ),
            FilledListTile(
              title: "Delete",
              iconColor: AppColors.red,
              textColor: AppColors.red,

              icon: Icons.delete,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
