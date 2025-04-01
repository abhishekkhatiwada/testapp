import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testapp/common/utils/navigation_service.dart';
import 'package:testapp/common/widgets/%20buttons/custom_rounded_button.dart';
import 'package:testapp/common/widgets/page_wrapper.dart';
import 'package:testapp/common/widgets/text_field/custom_textfield.dart';
import 'package:testapp/common/widgets/title_description_widget.dart';
import 'package:testapp/features/authentication/ui/screens/setup_password.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleDescriptionWidget(
              icon: Icons.lock_outline,
              hasIcon: true,
              title: "Reset Password",
              description:
                  "Enter the email associated with your account and we'll send an email to reset your password.",
              buttomGap: 24,
            ),
            CustomTextField(hintText: "Email"),
            SizedBox(height: 101),
            CustomRoundedButton(
              title: "verify".tr(),
              onPressed: () {
                NavigationService.push(target: SetupPassword());
              },
            ),
          ],
        ),
      ),
    );
  }
}
