import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testapp/common/utils/form_validator.dart';
import 'package:testapp/common/utils/size_config.dart';
import 'package:testapp/common/widgets/%20buttons/custom_rounded_button.dart';
import 'package:testapp/common/widgets/page_wrapper.dart';
import 'package:testapp/common/widgets/title_description_widget.dart';
import 'package:testapp/common/widgets/wrapper/custom_pin_field.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController otpController = TextEditingController();
    return PageWrapper(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.hp),
            TitleDescriptionWidget(
              title: "OTP Verify",
              description: "Please enter otp to verify",
              buttomGap: 24,
            ),

            Form(
              key: formKey,
              child: CustomPinCodeField(
                controller: otpController,
                isObscureText: false,
                length: 6,
                onChanged: (otp) {
                  otpController.text = otp;
                },
                validator:
                    (val) => FormValidator.validateFieldNotEmpty(val, 'OTP'),
              ),
            ),
            SizedBox(height: 101.hp),
            CustomRoundedButton(title: "verify".tr(), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
