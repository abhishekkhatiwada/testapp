import 'package:flutter/material.dart';
import 'package:testapp/app/app_colors.dart';
import 'package:testapp/common/utils/navigation_service.dart';
import 'package:testapp/common/utils/size_config.dart';
import 'package:testapp/common/widgets/page_wrapper.dart';
import 'package:testapp/common/widgets/title_description_widget.dart';
import 'package:testapp/features/authentication/ui/screens/email_verify_screen.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  final List<Map> verifyOptions = [
    {
      "title": "Email",
      "description": "Verify with your email",
      "icon": Icons.email_outlined,
    },
    {
      "title": "Phone number",
      "description": "Verify with your phone",
      "icon": Icons.phone_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleDescriptionWidget(
              title: "Verify your identity",
              description: "Choose a method to verify your identity",
              buttomGap: 37,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: verifyOptions.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  height: 72,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () {
                      if (index == 0) {
                        NavigationService.push(target: EmailVerifyScreen());
                      }
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 48.hp,
                          width: 48.hp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.iconColor,
                          ),
                          child: Icon(verifyOptions[index]['icon'], size: 24),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TitleDescriptionWidget(
                              title: verifyOptions[index]["title"],
                              description: verifyOptions[index]["description"],
                              fontSize: 14,
                              buttomGap: 0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
