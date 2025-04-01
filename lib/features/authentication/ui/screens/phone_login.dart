import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testapp/app/app_colors.dart';
import 'package:testapp/common/utils/navigation_service.dart';
import 'package:testapp/common/utils/size_config.dart';
import 'package:testapp/common/widgets/%20buttons/custom_rounded_button.dart';
import 'package:testapp/common/widgets/page_wrapper.dart';
import 'package:testapp/common/widgets/text_field/custom_textfield.dart';
import 'package:testapp/features/authentication/ui/screens/reset_password_screen.dart';
import 'package:testapp/features/authentication/ui/screens/signup_screen.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  bool isHidden = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return PageWrapper(
      padding: EdgeInsets.zero,
      showAppBar: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.hp),
            CustomTextField(
              hintText: "Phone Number",
              textInputType: TextInputType.number,
            ),
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
            SizedBox(height: 18.hp),
            GestureDetector(
              onTap: () {
                NavigationService.push(target: ResetPasswordScreen());
              },
              child: Text(
                "Forgot Password?",
                style: textTheme.titleSmall!.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),

            SizedBox(height: 51.hp),

            CustomRoundedButton(
              title: "auth.login".tr(),
              onPressed: () {
                //     NavigationService.push(target: EnableLocationScreen());
              },
              horizontalMargin: 0,
            ),

            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(vertical: 25),
              child: GestureDetector(
                onTap: () {
                  NavigationService.push(target: SignupScreen());
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'Don’t have an account? ',
                    style: textTheme.bodySmall,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: textTheme.titleSmall!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
