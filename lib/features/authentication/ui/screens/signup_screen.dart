import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testapp/app/app_colors.dart';
import 'package:testapp/common/utils/navigation_service.dart';
import 'package:testapp/common/utils/size_config.dart';
import 'package:testapp/common/widgets/%20buttons/custom_rounded_button.dart';
import 'package:testapp/common/widgets/page_wrapper.dart';
import 'package:testapp/common/widgets/text_field/custom_textfield.dart';
import 'package:testapp/common/widgets/title_description_widget.dart';
import 'package:testapp/features/authentication/ui/screens/login_screen.dart';
import 'package:testapp/features/authentication/ui/screens/verification_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isHidden = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return PageWrapper(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleDescriptionWidget(
              title: "auth.signup".tr(),
              description: "Let’s login with your Super Parking account !",
              buttomGap: 21.hp,
            ),
            CustomTextField(hintText: "Username"),
            SizedBox(height: 16.hp),
            CustomTextField(hintText: "Email"),
            SizedBox(height: 16.hp),
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
            SizedBox(height: 24.hp),

            CustomRoundedButton(
              horizontalMargin: 0,
              title: "continue".tr(),
              onPressed: () {
                NavigationService.push(target: VerificationScreen());
              },
            ),

            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(vertical: 25),
              child: GestureDetector(
                onTap: () {
                  NavigationService.pushReplacement(target: LoginScreen());
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'Already have an account? ',
                    style: textTheme.bodySmall,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Log In',
                        style: textTheme.titleSmall!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'By continuing forwards, you agree to Fitline\'s',
                  style: textTheme.bodyMedium,
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Privacy Policy',
                      style: textTheme.titleSmall!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: ' and ',
                      style: textTheme.bodySmall,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: textTheme.titleSmall!.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
