import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testapp/common/utils/navigation_service.dart';
import 'package:testapp/common/widgets/%20buttons/custom_rounded_button.dart';
import 'package:testapp/common/widgets/page_wrapper.dart';
import 'package:testapp/common/widgets/text_field/custom_textfield.dart';
import 'package:testapp/common/widgets/title_description_widget.dart';
import 'package:testapp/features/authentication/ui/screens/otp_verification_screen.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleDescriptionWidget(
              icon: Icons.email_outlined,
              hasIcon: true,
              title: "Email Address",
              description:
                  "We're going to send you a verification code to confirm your identity",
              buttomGap: 24,
            ),
            CustomTextField(hintText: "Email"),
            SizedBox(height: 101),
            CustomRoundedButton(
              title: "verify".tr(),
              onPressed: () {
                NavigationService.push(target: OtpVerificationScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
