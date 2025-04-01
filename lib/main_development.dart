import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:testapp/app/app_dev.dart';
import 'package:testapp/app/local_wrapper.dart';
import 'package:testapp/common/constants/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  const bool isDevicePreviewEnabled = false;
  runApp(
    DevicePreview(
      enabled: isDevicePreviewEnabled,
      builder: (context) {
        return LocalWrapper(child: AppDev(env: EnvValue.development));
      },
    ),
  );
}
