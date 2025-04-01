import 'package:flutter/material.dart';
import 'package:testapp/common/utils/size_config.dart';
import 'package:testapp/common/widgets/%20buttons/custom_rounded_button.dart';
import 'package:testapp/common/widgets/page_wrapper.dart';
import 'package:testapp/common/widgets/text_field/custom_textfield.dart';
import 'package:testapp/common/widgets/title_description_widget.dart';

class SetupPassword extends StatefulWidget {
  const SetupPassword({super.key});

  @override
  State<SetupPassword> createState() => _SetupPasswordState();
}

class _SetupPasswordState extends State<SetupPassword> {
  bool isHidden = false;
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final textTheme = theme.textTheme;
    return PageWrapper(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleDescriptionWidget(
              hasIcon: true,
              icon: Icons.lock_outline,
              title: "Enter New Password",
              description:
                  "Your new password must be different from previous used password.",
              buttomGap: 30,
            ),
            CustomTextField(
              hintText: "Password",
              suffixIcon:
                  isHidden
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
              showSearchIcon: true,
              obscureText: isHidden,
              suffixIconSize: 20,
              onSuffixPressed: () {
                setState(() {
                  isHidden = !isHidden;
                });
              },
            ),
            SizedBox(height: 16.hp),
            CustomTextField(
              hintText: "Confirm Password",
              suffixIcon:
                  isHidden
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
              showSearchIcon: true,
              obscureText: isHidden,
              suffixIconSize: 20,
              onSuffixPressed: () {
                setState(() {
                  isHidden = !isHidden;
                });
              },
            ),
            SizedBox(height: 46.hp),
            CustomRoundedButton(title: "Reset Password", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
